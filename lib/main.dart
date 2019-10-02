import 'package:core_x/routesGenerator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    initialRoute: '/',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
