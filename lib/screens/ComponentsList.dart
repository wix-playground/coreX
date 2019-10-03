import 'package:flutter/material.dart';

class ComponentsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Available Components'),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed('/editComponent', arguments: 'text');
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.text_fields),
                    Text('Text Component'),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
