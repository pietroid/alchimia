import 'package:alchimia_engine/src/data/box_widget_data.dart';
import 'package:flutter/material.dart';

extension BoxWidgetRenderer on BoxWidgetData {
  /// Converts this [BoxWidgetData] into a Flutter [Widget].
  Widget toWidget() {
    return Container(width: width, height: height, color: color);
  }
}
