import 'package:alchimia_engine/alchimia_engine.dart';
import 'package:alchimia_shell/src/cubit/canvas_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Displays the drop target canvas and renders all placed widgets.
class EngineCanvas extends StatelessWidget {
  const EngineCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Expanded(
      child: Center(
        child: BlocBuilder<CanvasCubit, CanvasState>(
          builder: (context, state) {
            return DragTarget<WidgetPayload>(
              onAcceptWithDetails: (details) {
                context.read<CanvasCubit>().addWidget(details.data);
              },
              builder: (context, candidateData, rejectedData) {
                final isHovering = candidateData.isNotEmpty;
                return Container(
                  width: 390,
                  height: 844,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    border: Border.all(
                      color: isHovering
                          ? colorScheme.onSurface
                          : colorScheme.outline,
                      width: 1.5,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: state.payloads
                          .map((p) => EngineRenderer(payload: p))
                          .toList(),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
