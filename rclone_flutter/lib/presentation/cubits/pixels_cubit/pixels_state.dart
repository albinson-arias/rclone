part of 'pixels_cubit.dart';

sealed class PixelsState extends Equatable {
  const PixelsState();

  @override
  List<Object?> get props => [];
}

final class PixelsLoading extends PixelsState {
  const PixelsLoading();
}

final class PixelsLoaded extends PixelsState {
  const PixelsLoaded({required this.pixels});

  final List<BoardPixel> pixels;

  @override
  List<Object?> get props => [pixels];
}
