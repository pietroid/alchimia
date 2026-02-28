import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/cubit/canvas_cubit.dart';
import 'package:alchimia_shell/src/models/widget_catalog_item.dart';
import 'package:alchimia_shell/src/widgets/engine_canvas.dart';
import 'package:alchimia_shell/src/widgets/widget_menu_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Default catalog used when no catalog is provided to [ShellView].
final _defaultCatalog = [
  WidgetCatalogItem(
    name: 'BOX',
    payloadFactory: () => const ContainerPayload(
      width: 120,
      height: 80,
      // TODO(any): Move this to thematics.
      color: Color(0xFF4A4A8A),
    ),
  ),
];

/// Top-level shell that provides canvas state and assembles the layout.
class ShellView extends StatelessWidget {
  const ShellView({this.catalog, super.key});

  /// Widget palette. Defaults to [_defaultCatalog] when null.
  final List<WidgetCatalogItem>? catalog;

  @override
  Widget build(BuildContext context) {
    final items = catalog ?? _defaultCatalog;
    return BlocProvider(
      create: (_) => CanvasCubit(),
      child: Scaffold(
        // TODO(any): Move this to thematics.
        backgroundColor: const Color(0xFF0D0D0D),
        body: Row(
          children: [
            WidgetMenuPanel(items: items),
            const EngineCanvas(),
          ],
        ),
      ),
    );
  }
}
