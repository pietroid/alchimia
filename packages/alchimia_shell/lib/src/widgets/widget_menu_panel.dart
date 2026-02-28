import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/models/widget_catalog_item.dart';
import 'package:flutter/material.dart';

/// Left-hand panel listing draggable widget catalog entries.
class WidgetMenuPanel extends StatelessWidget {
  const WidgetMenuPanel({required this.items, super.key});

  final List<WidgetCatalogItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      // TODO(any): Move this to thematics.
      color: const Color(0xFF1A1A1A),
      child: Column(
        children: items.map((item) => _DraggableItem(item: item)).toList(),
      ),
    );
  }
}

class _DraggableItem extends StatelessWidget {
  const _DraggableItem({required this.item});

  final WidgetCatalogItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // TODO(any): Move this to thematics.
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Draggable<WidgetPayload>(
        data: item.payloadFactory(),
        feedback: _BoxIcon(name: item.name),
        childWhenDragging: Opacity(
          opacity: 0.3,
          child: _BoxIcon(name: item.name),
        ),
        child: _BoxIcon(name: item.name),
      ),
    );
  }
}

class _BoxIcon extends StatelessWidget {
  const _BoxIcon({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF4A4A4A)),
        // TODO(any): Move this to thematics.
        color: const Color(0xFF2A2A2A),
      ),
      child: Center(
        // TODO(any): Move this to thematics.
        child: Text(
          name,
          style: const TextStyle(
            fontFamily: 'Menlo',
            fontSize: 9,
            color: Color(0xFF888888),
          ),
        ),
      ),
    );
  }
}
