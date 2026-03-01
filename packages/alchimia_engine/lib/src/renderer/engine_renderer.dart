import 'package:alchimia_engine/src/data/box_widget_data.dart';
import 'package:alchimia_engine/src/data/widget_data.dart';
import 'package:alchimia_engine/src/data/widget_type.dart';
import 'package:alchimia_engine/src/renderer/box_widget_renderer.dart';
import 'package:flutter/material.dart';

/// Renders a [WidgetData] into its corresponding Flutter widget.
class EngineRenderer extends StatelessWidget {
  const EngineRenderer({required this.data, super.key});

  final WidgetData data;

  @override
  Widget build(BuildContext context) {
    return switch (data.type) {
      WidgetType.box => (data as BoxWidgetData).toWidget(),
      _ => const SizedBox.shrink(),
    };
  }
}
