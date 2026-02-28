import 'package:alchimia_engine/src/payload/widget_payload.dart';
import 'package:flutter/material.dart';

/// Renders a [WidgetPayload] into its corresponding Flutter widget.
class EngineRenderer extends StatelessWidget {
  const EngineRenderer({required this.payload, super.key});

  final WidgetPayload payload;

  @override
  Widget build(BuildContext context) {
    if (payload is ContainerPayload) {
      final p = payload as ContainerPayload;
      return Container(
        width: p.width,
        height: p.height,
        color: p.color,
      );
    }
    return const SizedBox.shrink();
  }
}
