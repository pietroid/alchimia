import 'package:alchimia_engine/src/data/widget_type.dart';
import 'package:equatable/equatable.dart';

/// Base class for all widget payloads.
///
/// A payload carries the data needed to render a specific widget type.
abstract class WidgetData extends Equatable {
  const WidgetData({required this.type});

  /// The type of widget this payload represents.
  final WidgetType type;

  @override
  List<Object?> get props => [type];
}
