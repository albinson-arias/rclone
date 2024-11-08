import 'package:rclone_server/src/generated/protocol.dart';
import 'package:rclone_server/src/queries/board_endpoint_sql_queries.dart';
import 'package:serverpod/serverpod.dart';

class BoardEndpoint extends Endpoint {
  static const _channelBoardPixelAdded = 'board-pixel-added';
  static const _channelUserBoardPixelAdded = 'user-board-pixel-added-';

  String getUsernameBoardPixelChannel(String username) {
    return '$_channelUserBoardPixelAdded$username';
  }

  /// Writes a pixel on the board.
  Future<void> writePixel(Session session, BoardPixel pixel) async {
    await session.db.transaction(
      (transaction) async {
        await BoardPixel.db.deleteWhere(session,
            where: (t) => (t.x.equals(pixel.x) & t.y.equals(pixel.y)),
            transaction: transaction);

        await BoardPixel.db.insertRow(session, pixel, transaction: transaction);

        session.messages.postMessage(
          _channelBoardPixelAdded,
          pixel,
          global: true,
        );

        session.messages.postMessage(
          getUsernameBoardPixelChannel(pixel.username),
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

  /// Returns a stream of pixels added by given user.
  /// The first message will contain the full board.
  /// Sequential updates will contain a single updated pixel.
  Stream<Board> listenToUserBoard(Session session, String username) async* {
    final updateStream = session.messages
        .createStream<BoardPixel>(getUsernameBoardPixelChannel(username));

    final board = await BoardPixel.db.find(
      session,
      where: (t) => t.username.equals(username),
    );

    yield Board(pixels: board);

    await for (final pixel in updateStream) {
      yield Board(pixels: [pixel]);
    }
  }

  /// Returns a list of all users which have written at least
  /// a pixel on the board
  Future<List<String>> getUsers(Session session) async {
    final result = await session.db.unsafeQuery(getUsersSQLQuery);

    final usernames = result.map((element) => element.first as String).toList();

    return usernames;
  }
}
