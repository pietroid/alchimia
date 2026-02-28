import 'package:alchimia_shell/alchimia_shell.dart';
import 'package:alchimia_thematics/alchimia_thematics.dart';
import 'package:flutter/material.dart';

class CreationPage extends StatelessWidget {
  const CreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlchimiaThematicsProvider(
      child: ShellView(),
    );
  }
}
