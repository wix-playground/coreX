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
  final srcController = TextEditingController();
  final textController = TextEditingController();

  _EditComponentState(this.component);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    srcController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Data data = Provider.of<Data>(context);
    final appId = data.activeAppId;

    String componentType = component.type.toLowerCase();
    print(componentType);


    if(componentType == 'link') {
      return Scaffold(
          appBar: AppBar(
            title: Text('Edititing link component'),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    controller: srcController,
                    decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        hintText: 'Put here link src'
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    controller: textController,
                    decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        hintText: 'Put here link text'
                    )),
              ),
              RaisedButton(
                onPressed: () {
                  data.addComponent(
                      appId,
                      UIComponent.fromJSON({
                        "id": component.id,
                        "type": componentType,
                        "value": {"src": srcController.text, "text": textController.text}
                      }));

                  Navigator.of(context).pushNamed('/editor', arguments: appId);
                },
                child: Text('Create ${component.type.toLowerCase()} component'),
              )
            ],
          ));
    }
    if(['text', 'heading'].contains(componentType)) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Edititing $componentType component'),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    controller: textController,
                    decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        hintText: 'Put here text'
                    )),
              ),
              RaisedButton(
                onPressed: () {
                  data.addComponent(
                      appId,
                      UIComponent.fromJSON({
                        "id": component.id,
                        "type": component.type.toLowerCase(),
                        "value": {"text": textController.text}
                      }));

                  Navigator.of(context).pushNamed('/editor', arguments: appId);
                },
                child: Text('Create ${component.type.toLowerCase()} component'),
              )
            ],
          ));
    }

    if(componentType == 'image') {
      return Scaffold(
          appBar: AppBar(
            title: Text('Edititing image component'),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    controller: srcController,
                    decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        hintText: 'Put here image src'
                    )),
              ),
              RaisedButton(
                onPressed: () {
                  data.addComponent(
                      appId,
                      UIComponent.fromJSON({
                        "id": component.id,
                        "type": componentType,
                        "value": {"src": srcController.text}
                      }));

                  Navigator.of(context).pushNamed('/editor', arguments: appId);
                },
                child: Text('Create ${component.type.toLowerCase()} component'),
              )
            ],
          ));
    }

    if(componentType == 'button') {
      return Scaffold(
          appBar: AppBar(
            title: Text('Edititing button component'),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                    controller: textController,
                    decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.blueGrey, width: 2.0),
                        ),
                        hintText: 'Put here button text'
                    )),
              ),
              RaisedButton(
                onPressed: () {
                  data.addComponent(
                      appId,
                      UIComponent.fromJSON({
                        "id": component.id,
                        "type": componentType,
                        "value": {"label": textController.text}
                      }));

                  Navigator.of(context).pushNamed('/editor', arguments: appId);
                },
                child: Text('Create ${component.type.toLowerCase()} component'),
              )
            ],
          ));
    }
  }
}
