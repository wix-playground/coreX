import 'package:flutter/material.dart';
import 'package:core_x/data-layer/data.dart';
import 'package:provider/provider.dart';

class NewAppScreen extends StatefulWidget {
  NewAppScreen({Key key}) : super(key: key);
  @override
  _NewAppScreenState createState() => _NewAppScreenState();
}

class _NewAppScreenState extends State<NewAppScreen> {
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

    return Scaffold(
        appBar: AppBar(
          title: Text('New app'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                  controller: myController,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.blueGrey, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.blueGrey, width: 2.0),
                    ),
                    hintText: 'Enter a name for your new App',
                  )),
            ),
            RaisedButton(
              onPressed: () {
                String newAppId = data.addApp(myController.text); // Creating new App
                Provider.of<Data>(context).setActiveAppId(newAppId);
                Navigator.of(context).pushNamed('/editor', arguments: newAppId);
              },
              child: Text('Create'),
            )
          ],
        ));
  }
}
