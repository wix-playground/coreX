import 'dart:math';

import 'package:flutter/cupertino.dart';
import './mocks.dart';
enum ComponentType {
  Heading,
  Text,
  Button,
  Link,
  Image,
  Dropdown
}

class UIComponent {
  String id;
  Map<String, dynamic> value;
  List<String> handlers;
  String type;

  UIComponent(this.id, this.type, this.value, this.handlers);

  UIComponent.fromJSON(Map<String, dynamic> json) :
      id = json['id'],
      type = json['type'],
      value = json['value'],
      handlers = json['handlers'];
}

class UISchema {
  List<String> order;
  Map<String, UIComponent> components;

  UISchema(Iterable jsonOrder, Map<String, dynamic> jsonComponents) {
    order = List<String>.from(jsonOrder);
    components = {};
    jsonComponents.values.forEach(
      (component) => components[component['id']] = UIComponent.fromJSON(component)
    );
  }
}

class App {
  String id;
  String title;
  UISchema uiSchema;

  App(this.id, this.title, this.uiSchema);
  App.fromJSON(Map<String, dynamic> json):
        id = json['id'],
        title = json['title'],
        uiSchema = UISchema(
            json['uiSchema']['order'],
            json['uiSchema']['components']
        );
}

Map<String, App> mocks = {
  'appId1': App.fromJSON(JSONMocks['appId1'])
};

class Data extends ChangeNotifier {
  Map<String, App> _apps;

  String _activeAppId;

  Data() {
    this._apps = mocks;
  }

  Map<String, App> get apps => this._apps;

  String get activeAppId => this._activeAppId;

  void setActiveAppId(String id) {
    _activeAppId = id;
    notifyListeners();
  }

  void addComponent(String appId, UIComponent component) {
    App app = _apps[appId];
    if(app == null) {
      return;
    }
    if (component.id == null) {
      component.id = Random().nextDouble().toString();
    }
    print(app.uiSchema.order.runtimeType);
    app.uiSchema.order.add(component.id);
    app.uiSchema.components[component.id] = component;
    notifyListeners();
  }

  void moveComponentUp(String appId, String componentId) {
    App app = _apps[appId];
    int currentIndex = app.uiSchema.order.indexOf(componentId);
    if (currentIndex == 0 || currentIndex == -1) {
      return;
    }
    int targetIndex = currentIndex - 1;
    app.uiSchema.order
      ..removeAt(currentIndex)
      ..insert(targetIndex, componentId);
    notifyListeners();
  }

  void moveComponentDown(String appId, String componentId) {
    App app = _apps[appId];
    int currentIndex = app.uiSchema.order.indexOf(componentId);
    if (currentIndex == app.uiSchema.order.length - 1 || currentIndex == -1) {
      return;
    }
    int targetIndex = currentIndex + 1;
    app.uiSchema.order
      ..removeAt(currentIndex)
      ..insert(targetIndex, componentId);
    notifyListeners();
  }

}