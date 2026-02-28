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
      color: Theme.of(context).colorScheme.surfaceContainer,
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
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outlineVariant),
        color: colorScheme.outline,
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 9,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
