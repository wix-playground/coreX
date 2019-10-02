import 'package:core_x/routesGenerator.dart';
import 'package:core_x/data-layer/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Data>(
      builder: (context) => Data(),
      dispose: (context, value) => value.dispose(),
      child: MaterialApp(
        title: 'Named Routes Demo',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      )
    );
  }
}


