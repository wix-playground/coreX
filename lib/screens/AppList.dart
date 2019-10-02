import 'dart:html';

import 'package:flutter/material.dart';

class AppListScreen extends StatelessWidget {
  final items = List<String>.generate(
    4,
    (i) => "$i",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Core X'),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/editor', arguments: item);
                },
                child: Text(item,
                    style: TextStyle(
                      fontSize: 25,
                    )));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.of(context).pushNamed('/editor');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
