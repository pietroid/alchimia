import 'package:alchimia/app/app.dart';
import 'package:alchimia/bootstrap.dart';
import 'package:flutter/material.dart';

void main() {
  bootstrap(() => const App());
}

Widget function() {
  return Container(width: 100, height: 100, color: Colors.red);
}
