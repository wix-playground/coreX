dynamic mockedApp = {
  'uiSchema': {
    'order': [
      'id1',
      'id2'
    ],
    'components': {
      'id1': {
        'id': 'id1',
        'type': 'heading',
        'value': {
          'text': "Heading of the app"
        }
      },
      'id2': {
        'id': 'id2',
        'type': 'button',
        'handlers': [
          'alert'
        ]
      }
    }
  }
};

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
    mockedApp['uiSchema']
  )
};


enum ComponentType {
  Heading,
  Text,
  Button,
  Link,
  Image,
  Dropdown
}

abstract class UIComponent {
  String id;
  Map<String, dynamic> value;
  List<String> handlers;
  String type;
}

abstract class UISchema {
  List<String> order;
  Map<String, UIComponent> components;
}

class Data {
  Map<String, App> getAllApps() {
    return mocks;
  }
}