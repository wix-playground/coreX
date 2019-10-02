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
}

class UISchema {
  List<String> order;
  Map<String, UIComponent> components;

  UISchema(this.order, this.components);
}

class App {
  String id;
  String title;
  UISchema uiSchema;
  App(this.id, this.title, this.uiSchema);
}

Map<String, App> mocks = {
  'appId1': App(
      'appId1',
      'App',
      UISchema(
          ['id1', 'id2'],
          {
            'id1': UIComponent('id1', 'heading', {'value': 'Some random text'}, []),
            'id2': UIComponent('id2', 'button', {'label': 'Alert!'}, ['alert']),
          }
      )
  )
};

class Data {
  Map<String, App> apps;
  Data(): this.apps = mocks;

  void dispose() {

  }
}