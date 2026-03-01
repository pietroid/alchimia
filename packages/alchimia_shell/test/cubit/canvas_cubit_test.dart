import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/cubit/canvas_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CanvasCubit', () {
    test('initial state has empty widgets list', () {
      expect(CanvasCubit().state.widgets, isEmpty);
    });

    blocTest<CanvasCubit, CanvasState>(
      'addWidget once appends the widget',
      build: CanvasCubit.new,
      act:
          (cubit) => cubit.addWidget(
            const BoxWidgetData(
              width: 100,
              height: 50,
              color: Color(0xFF0000FF),
            ),
          ),
      expect:
          () => const [
            CanvasState(
              widgets: [
                BoxWidgetData(width: 100, height: 50, color: Color(0xFF0000FF)),
              ],
            ),
          ],
    );

    blocTest<CanvasCubit, CanvasState>(
      'addWidget twice appends both widgets in order',
      build: CanvasCubit.new,
      act: (cubit) {
        cubit
          ..addWidget(
            const BoxWidgetData(
              width: 100,
              height: 50,
              color: Color(0xFF0000FF),
            ),
          )
          ..addWidget(
            const BoxWidgetData(
              width: 200,
              height: 80,
              color: Color(0xFFFF0000),
            ),
          );
      },
      expect:
          () => const [
            CanvasState(
              widgets: [
                BoxWidgetData(width: 100, height: 50, color: Color(0xFF0000FF)),
              ],
            ),
            CanvasState(
              widgets: [
                BoxWidgetData(width: 100, height: 50, color: Color(0xFF0000FF)),
                BoxWidgetData(width: 200, height: 80, color: Color(0xFFFF0000)),
              ],
            ),
          ],
    );
  });
}
