part of 'canvas_cubit.dart';

/// Immutable state for [CanvasCubit].
class CanvasState extends Equatable {
  const CanvasState({this.widgets = const []});

  /// Ordered list of widgets present on the canvas.
  final List<WidgetData> widgets;

  CanvasState copyWith({List<WidgetData>? widgets}) {
    return CanvasState(widgets: widgets ?? this.widgets);
  }

  @override
  List<Object?> get props => [widgets];
}
