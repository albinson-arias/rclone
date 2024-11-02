import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rclone_client/rclone_client.dart';
import 'package:rclone_flutter/core/extensions/offset_extension.dart';

part 'pixels_state.dart';

class PixelsCubit extends Cubit<PixelsState> {
  PixelsCubit(this._client) : super(const PixelsInitial()) {
    setInitialBoardZoom();
  }

  final Client _client;
  Timer? writeTimer;
  String username = '';
  final viewTransformationController = TransformationController();
  StreamSubscription<Board>? pixelsStream;

  @override
  Future<void> close() async {
    viewTransformationController.dispose();
    await pixelsStream?.cancel();
    super.close();
  }

  void setInitialBoardZoom() {
    final zoomFactor = kIsWeb ? 0.5 : 0.2;
    viewTransformationController.value.setEntry(0, 0, zoomFactor);
    viewTransformationController.value.setEntry(1, 1, zoomFactor);
    viewTransformationController.value.setEntry(2, 2, zoomFactor);
  }

  Future<void> loadPixels(String user, {bool isWatching = false}) async {
    username = user.toLowerCase();
    emit(PixelsLoading());
    // while (true) {
    try {
      // Get the stream of updates from the server.
      final pixelUpdates = isWatching
          ? _client.board.listenToUserBoard(user)
          : _client.board.listenToBoard();

      pixelsStream = pixelUpdates.listen(
          (board) {
            // Check which type of update we have received.
            if (state is PixelsLoading) {
              emit(PixelsLoaded(pixels: board.pixels));
            } else {
              final actualState = state as PixelsLoaded;
              emit(PixelsLoaded(
                  pixels: [...actualState.pixels, ...board.pixels]));
            }
          },
          cancelOnError: true,
          onError: (_) async {
            retryLoadPixels(user, isWatching);
          });
    } catch (_) {
      // We lost the connection to the server, or failed to connect.
      // Wait 5 seconds until we try to connect again.
      retryLoadPixels(user, isWatching);
    }
    // }
  }

  Future<void> retryLoadPixels(String user, bool isWatching) async {
    emit(PixelsLoading());
    debugPrint('retrying in 5...');
    await Future.delayed(Duration(seconds: 5));
    loadPixels(user, isWatching: isWatching);
  }

  void writePixel(Offset offset, Color color) {
    // writeTimer = Timer(
    //   Duration(milliseconds: 50),
    //   () {
    if (state is! PixelsLoaded) return;
    final actualState = state as PixelsLoaded;
    final pixel = BoardPixel(
      x: offset.round().dx,
      y: offset.round().dy,
      color: colorToHex(color),
      username: username,
    );
    final pixels = [...actualState.pixels]..removeWhere(
        (element) => element.x == pixel.x && element.y == pixel.y,
      );

    emit(PixelsLoaded(pixels: pixels));

    _client.board.writePixel(pixel);
    // },
    // );
  }
}
