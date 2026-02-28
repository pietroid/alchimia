part of 'canvas_cubit.dart';

/// Immutable state for [CanvasCubit].
class CanvasState extends Equatable {
  const CanvasState({this.payloads = const []});

  /// Ordered list of payloads present on the canvas.
  final List<WidgetPayload> payloads;

  CanvasState copyWith({List<WidgetPayload>? payloads}) {
    return CanvasState(payloads: payloads ?? this.payloads);
  }

  @override
  List<Object?> get props => [payloads];
}
