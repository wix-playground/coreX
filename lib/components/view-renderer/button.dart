import 'package:core_x/data-layer/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget createButtonComponent(UIComponent component, bool inactive) {
  return RaisedButton(
    onPressed: inactive ? null : () => print('Button ${component.id} clicked'),
    child: Text(component.value['label']),
  );
}
