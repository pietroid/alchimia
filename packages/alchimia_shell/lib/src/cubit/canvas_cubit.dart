import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'canvas_state.dart';

/// Manages the list of [WidgetData]s dropped onto the canvas.
class CanvasCubit extends Cubit<CanvasState> {
  CanvasCubit() : super(const CanvasState());

  /// Appends [widget] to the end of the canvas widget list.
  void addWidget(WidgetData widget) {
    emit(state.copyWith(widgets: [...state.widgets, widget]));
  }
}
