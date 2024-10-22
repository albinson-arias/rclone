import 'package:rclone_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class BoardEndpoint extends Endpoint {
  static const _channelPixelAdded = 'pixel-added';

  Future<void> writePixel(Session session, Pixel pixel) async {
    await session.db.transaction(
      (transaction) async {
        final count = await Pixel.db.count(session,
            limit: 1,
            where: (t) => (t.x.equals(pixel.x) & t.y.equals(pixel.y)),
            transaction: transaction);

        if (count != 0) {
          await Pixel.db.deleteWhere(session,
              where: (t) => (t.x.equals(pixel.x) & t.y.equals(pixel.y)),
              transaction: transaction);
        }

        await Pixel.db.insertRow(session, pixel, transaction: transaction);
        session.messages.postMessage(
          _channelPixelAdded,
          pixel,
          global: true,
        );
      },
    );
  }

  /// Returns a stream of pixels. The first message will contain
  /// the full board. Sequential updates will contain a single updated pixel.
  Stream<List<Pixel>> listenToBoard(Session session) async* {
    final updateStream =
        session.messages.createStream<Pixel>(_channelPixelAdded);

    final board = await Pixel.db.find(session);

    yield board;

    await for (final pixel in updateStream) {
      yield [pixel];
    }
  }
}
