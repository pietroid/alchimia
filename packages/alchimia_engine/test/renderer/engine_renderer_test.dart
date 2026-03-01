import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_engine/src/data/widget_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EngineRenderer', () {
    testWidgets(
      'renders Container with correct dimensions and color for BoxWidgetData',
      (tester) async {
        const payload = BoxWidgetData(
          width: 120,
          height: 80,
          color: Color(0xFF4A4A8A),
        );

        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(body: EngineRenderer(data: payload)),
          ),
        );

        final container = tester.widget<Container>(find.byType(Container));
        expect(container.constraints?.maxWidth, 120);
        expect(container.constraints?.maxHeight, 80);
        expect(
          (container.decoration as BoxDecoration?)?.color ?? container.color,
          const Color(0xFF4A4A8A),
        );
      },
    );

    testWidgets('renders SizedBox.shrink for unknown payload type', (
      tester,
    ) async {
      const data = _UnknownData();

      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: EngineRenderer(data: data))),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 0.0);
      expect(sizedBox.height, 0.0);
    });
  });
}

class _UnknownData extends WidgetData {
  const _UnknownData() : super(type: WidgetType.unknown);
}
