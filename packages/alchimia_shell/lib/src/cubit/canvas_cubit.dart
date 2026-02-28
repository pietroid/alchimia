import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'canvas_state.dart';

/// Manages the list of [WidgetPayload]s dropped onto the canvas.
class CanvasCubit extends Cubit<CanvasState> {
  CanvasCubit() : super(const CanvasState());

  /// Appends [payload] to the end of the canvas payload list.
  void addWidget(WidgetPayload payload) {
    emit(state.copyWith(payloads: [...state.payloads, payload]));
  }
}
