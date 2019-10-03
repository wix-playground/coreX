import 'package:core_x/data-layer/data.dart';
import 'package:flutter/cupertino.dart';

Widget createImageComponent(UIComponent component) {
  return Image(
    image: NetworkImage(component.value['src']),
  );
}
