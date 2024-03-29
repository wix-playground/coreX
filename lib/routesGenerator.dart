import 'package:core_x/screens/EditComponent.dart';
import 'package:flutter/material.dart';
import 'package:core_x/screens/AppList.dart';
import 'package:core_x/screens/ComponentsList.dart';
import 'package:core_x/screens/Editor.dart';
import 'package:core_x/screens/Preview.dart';
import 'package:core_x/screens/NewApp.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => AppListScreen());
      case '/new-app':
        return MaterialPageRoute(builder: (context) => NewAppScreen());
      case '/editor':
        if (args is String) {
          return MaterialPageRoute(
              builder: (context) => EditorScreen(
                    appId: settings.arguments,
                  ));
        }
        return _errorRoute();

      case '/preview':
        return MaterialPageRoute(builder: (context) => PreviewScreen());
      case '/componentsList':
        return MaterialPageRoute(builder: (context) => ComponentsListScreen());
      case '/editComponent':
        return MaterialPageRoute(
            builder: (context) => EditComponentScreen(
                  component: args,
                ));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(appBar: AppBar(title: Text('Error')));
    });
  }
}
