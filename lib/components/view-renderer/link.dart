import 'package:core_x/data-layer/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget createLinkComponent(UIComponent component, bool inactive) {
  return Center(
    child: InkWell(
        child: Text(component.value['text']),
        onTap: inactive ? null : () => launch(component.value['src'])
    ),
  );
}
