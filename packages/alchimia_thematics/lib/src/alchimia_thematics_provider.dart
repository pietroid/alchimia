import 'package:alchimia_thematics/src/alchimia_theme.dart';
import 'package:flutter/material.dart';

/// Injects [AlchimiaTheme] into the widget tree without wrapping in [MaterialApp].
class AlchimiaThematicsProvider extends StatelessWidget {
  const AlchimiaThematicsProvider({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AlchimiaTheme.data,
      child: child,
    );
  }
}
