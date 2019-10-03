import 'package:core_x/data-layer/data.dart';
import 'package:flutter/cupertino.dart';

Widget createTextComponent(UIComponent component) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    child: RichText(
      text: TextSpan(
        text: component.value['text'],
        style: TextStyle(
          fontSize: 18,
          color: Color(0xFF000000),
        ),
      ),
    ),
  );
}
