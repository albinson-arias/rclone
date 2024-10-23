import 'dart:async';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rclone_client/rclone_client.dart';
import 'package:rclone_flutter/core/extensions/offset_extension.dart';

part 'pixels_state.dart';

class PixelsCubit extends Cubit<PixelsState> {
  PixelsCubit(this._client) : super(const PixelsLoading()) {
    Future<void>.delayed(const Duration(milliseconds: 500)).then(
      (value) {
        loadPixels();
      },
    );
  }

  final Client _client;
  Timer? writeTimer;

  Future<void> loadPixels() async {
    while (true) {
      try {
        // Get the stream of updates from the server.
        final pixelUpdates = _client.board.listenToBoard();

        // Listen for updates from the stream. The await for construct will
        // wait for a message to arrive from the server, then run through the
        // body of the loop.
        await for (final board in pixelUpdates) {
          // Check which type of update we have received.
          if (state is PixelsLoading) {
            emit(PixelsLoaded(pixels: board.pixels));
          } else {
            final actualState = state as PixelsLoaded;
            emit(
                PixelsLoaded(pixels: [...actualState.pixels, ...board.pixels]));
          }
        }
      } on MethodStreamException catch (_) {
        // We lost the connection to the server, or failed to connect.
        emit(PixelsLoading());
      }

      // Wait 5 seconds until we try to connect again.
      await Future.delayed(Duration(seconds: 5));
    }
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
    );
    final pixels = [...actualState.pixels]..removeWhere(
        (element) => element.x == pixel.x && element.y == pixel.y,
      );

    emit(PixelsLoaded(pixels: pixels));

    _client.board.writePixel(pixel);
    // },
    // );
  }

  void cancelPendingWrite() {
    // writeTimer?.cancel();
  }
}
