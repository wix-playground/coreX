import 'package:core_x/data-layer/data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as UI;

Widget createHeadingComponent(UIComponent component) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 32.0),
    child: Center(
      child: Text(
        component.value['text'],
        style: TextStyle(
          fontSize: 32,
          fontWeight: UI.FontWeight.bold,
        ),
      ),
    ),
  );
}
