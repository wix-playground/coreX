import 'package:core_x/components/view-renderer/viewRenderer.dart';
import 'package:core_x/data-layer/data.dart';
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
          child: ListView.builder(
              itemCount: app.uiSchema.order.length,
              itemBuilder: (context, index) {
                String componentId = app.uiSchema.order[index];
                UIComponent component = app.uiSchema.components[componentId];
                Widget componentUI = ViewRenderer.getView(component, true);

                return FlatButton(
                  child: componentUI,
                  onPressed: () => print('EDIT COMPONENT ${componentId}'),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/componentsList'),
        child: Icon(Icons.add),
      ),
    );
  }
}
