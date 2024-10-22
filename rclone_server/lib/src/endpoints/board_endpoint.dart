import 'package:rclone_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class BoardEndpoint extends Endpoint {
  static const _channelBoardPixelAdded = 'board-pixel-added';

  Future<void> writePixel(Session session, BoardPixel pixel) async {
    await session.db.transaction(
      (transaction) async {
        final count = await BoardPixel.db.count(session,
            limit: 1,
            where: (t) => (t.x.equals(pixel.x) & t.y.equals(pixel.y)),
            transaction: transaction);

        if (count != 0) {
          await BoardPixel.db.deleteWhere(session,
              where: (t) => (t.x.equals(pixel.x) & t.y.equals(pixel.y)),
              transaction: transaction);
        }

        await BoardPixel.db.insertRow(session, pixel, transaction: transaction);
        session.messages.postMessage(
          _channelBoardPixelAdded,
          pixel,
          global: true,
        );
      },
    );
  }

  /// Returns a stream of pixels. The first message will contain
  /// the full board. Sequential updates will contain a single updated pixel.
  Stream<Board> listenToBoard(Session session) async* {
    final updateStream =
        session.messages.createStream<BoardPixel>(_channelBoardPixelAdded);

    final board = await BoardPixel.db.find(session);

    yield Board(pixels: board);

    await for (final pixel in updateStream) {
      yield Board(pixels: [pixel]);
    }
  }
}
