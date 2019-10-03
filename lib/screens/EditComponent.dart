import 'package:core_x/screens/ComponentsList.dart';
import 'package:flutter/material.dart';
import 'package:core_x/data-layer/data.dart';
import 'package:provider/provider.dart';

class EditComponentScreen extends StatefulWidget {
  final Component component;

  EditComponentScreen({Key key, @required this.component}) : super(key: key);
  @override
  _EditComponentState createState() => _EditComponentState(component);
}

class _EditComponentState extends State<EditComponentScreen> {
  Component component;
  final myController = TextEditingController();

  _EditComponentState(this.component);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Data data = Provider.of<Data>(context);
    final appId = data.activeAppId;
    return Scaffold(
        appBar: AppBar(
          title: Text('Edititing text component'),
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
                    hintText: ['Image', 'Link'].contains(component.type)
                        ? 'put here your link'
                        : 'enter the text',
                  )),
            ),
            RaisedButton(
              onPressed: () {
                print(component.type);
                if (['Image', 'Link'].contains(component.type)) {
                  data.addComponent(
                      appId,
                      UIComponent.fromJSON({
                        "id": component.id,
                        "type": component.type.toLowerCase(),
                        "value": {"src": myController.text}
                      }));
                }

                if (['Heading', 'text'].contains(component.type)) {
                  data.addComponent(
                      appId,
                      UIComponent.fromJSON({
                        "id": component.id,
                        "type": component.type.toLowerCase(),
                        "value": {"text": myController.text}
                      }));
                }
                // print(component.type);

                Navigator.of(context).pushNamed('/editor', arguments: appId);
              },
              child: Text('Create ${component.type.toLowerCase()} component'),
            )
          ],
        ));
  }
}
