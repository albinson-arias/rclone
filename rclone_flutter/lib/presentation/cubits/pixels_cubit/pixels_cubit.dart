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

  @override
  Future<void> close() async {
    viewTransformationController.dispose();
    super.close();
  }

  void setInitialBoardZoom() {
    final zoomFactor = kIsWeb ? 0.5 : 0.2;
    viewTransformationController.value.setEntry(0, 0, zoomFactor);
    viewTransformationController.value.setEntry(1, 1, zoomFactor);
    viewTransformationController.value.setEntry(2, 2, zoomFactor);
  }

  Future<void> loadPixels(String user) async {
    username = user.toLowerCase();
    emit(PixelsLoading());
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
      } catch (_) {
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

  void cancelPendingWrite() {
    // writeTimer?.cancel();
  }
}
