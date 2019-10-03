import 'dart:math';

import 'package:flutter/material.dart';

class Component {
  String type;
  String id;
  IconData icon;

  Component(String type, IconData icon) {
    this.type = type;
    this.id = Random().nextDouble().toString();
    this.icon = icon;
  }
}

class ComponentsListScreen extends StatelessWidget {
  final List<Component> components = [
    Component('Text', Icons.text_fields),
    Component('Image', Icons.image),
    Component('Link', Icons.link),
    Component('Heading', Icons.text_fields),
    Component('Button', Icons.directions_car),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Available Components'),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: components.length,
                itemBuilder: (context, index) {
                  final component = components[index];

                  return FlatButton(
                    onPressed: () {
                      print(component.type);
                      Navigator.of(context)
                          .pushNamed('/editComponent', arguments: component);
                    },
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Icon(component.icon),
                        ),
                        Text(
                          '${component.type} component',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  );
                })));
  }
}
