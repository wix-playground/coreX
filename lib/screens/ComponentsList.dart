import 'package:flutter/material.dart';

class ComponentsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Available Components'),
        ),
        body: Center(
          child: Text('Components List'),
        ));
  }
}
