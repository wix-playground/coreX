import 'package:core_x/components/view-renderer/viewRenderer.dart';
import 'package:core_x/data-layer/data.dart';
import 'package:core_x/screens/ComponentsList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditorScreen extends StatelessWidget {
  final String appId;
  EditorScreen({Key key, @required this.appId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Data data = Provider.of<Data>(context);
    App app = data.apps[appId];
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return BackButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            );
          },
        ),
        title: Text('Editing app ${this.appId}'),
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
      body: Center(
        child: app.uiSchema.order.length == 0 ?
          Text(
            'You app has no components yet',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),
          ) :
          ListView.builder(
            itemCount: app.uiSchema.order.length,
            itemBuilder: (context, index) {
              String componentId = app.uiSchema.order[index];
              UIComponent component = app.uiSchema.components[componentId];
              Widget componentUI = ViewRenderer.getView(component, true);

              print(component);

              Map<String,IconData> iconsTypes = {
                'text': Icons.text_fields,
                'link': Icons.link,
                'heading': Icons.text_fields,
                'image': Icons.image,
                'button': Icons.directions_car,
              };

              return Stack(
                children: [
                  FlatButton(
                    child: componentUI,
                    onPressed: () {
                      Navigator
                          .of(context)
                          .pushNamed(
                            '/editComponent',
                            arguments: Component(component.type, iconsTypes[component.type], component.id, component.value)
                          );
                    },
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 152,
                      color: Color(0xAAFFFFFF),
                      child: ButtonBar(
                        children: [
                          FlatButton(
                            child: Icon(Icons.keyboard_arrow_down),
                            onPressed: () {
                              data.moveComponentDown(appId, componentId);
                            },
                          ),
                          FlatButton(
                            child: Icon(Icons.keyboard_arrow_up),
                            onPressed: () {
                              data.moveComponentUp(appId, componentId);
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/componentsList'),
        child: Icon(Icons.add),
      ),
    );
  }
}
