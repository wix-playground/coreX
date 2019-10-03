import 'package:core_x/components/view-renderer/button.dart';
import 'package:core_x/components/view-renderer/header.dart';
import 'package:core_x/components/view-renderer/image.dart';
import 'package:core_x/components/view-renderer/link.dart';
import 'package:core_x/components/view-renderer/text.dart';
import 'package:core_x/data-layer/data.dart';
import 'package:flutter/widgets.dart';

class ViewRenderer {
  static Widget getView(UIComponent component, bool inactive) {
    switch(component.type) {
      case 'text':
        return createTextComponent(component);
      case 'heading':
        return createHeadingComponent(component);
      case 'image':
        return createImageComponent(component);
      case 'button':
        return createButtonComponent(component, inactive);
      case 'link':
        return createLinkComponent(component, inactive);
      default:
        return Text('Cannot render ${component.id} of type ${component.type}');
    }
  }
}