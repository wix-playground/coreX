import 'package:flutter/material.dart';

class EditorScreen extends StatelessWidget {
  final String appId;
  EditorScreen({Key key, @required this.appId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editing app with id: ${this.appId}'),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed('/preview');
            },
            child: Text("Preview",
                style: TextStyle(
                  fontSize: 25,
                )),
          ),
        ],
      ),
      body: Center(child: Text('Selected components')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.of(context).pushNamed('/componentsList');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
