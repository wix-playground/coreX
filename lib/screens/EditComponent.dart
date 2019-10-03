import 'package:flutter/material.dart';
import 'package:core_x/data-layer/data.dart';
import 'package:provider/provider.dart';

class EditComponentScreen extends StatefulWidget {
  @override
  _EditComponentState createState() => _EditComponentState();
}

class _EditComponentState extends State<EditComponentScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Data data = Provider.of<Data>(context);
    final appId = 'appId1';
    App app = data.apps[appId];
    return Scaffold(
        appBar: AppBar(
          title: Text('Edititing text component'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
                controller: myController,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  hintText: 'Your text',
                )),
            RaisedButton(
              onPressed: () {
                data.addComponent(
                    appId,
                    UIComponent.fromJSON({
                      "id": 'fasdfasd',
                      "type": "text",
                      "value": {"text": myController.text}
                    }));
                Navigator.of(context).pushNamed('/editor', arguments: appId);
              },
              child: Text('Create text component'),
            )
          ],
        ));
  }
}
