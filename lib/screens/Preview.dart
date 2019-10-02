import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Preview Mode'),
        ),
        body: Center(
          child: Text('Preview'),
        ));
  }
}
