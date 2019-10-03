import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data-layer/data.dart';
import '../components/view-renderer/viewRenderer.dart';

class PreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Data data = Provider.of<Data>(context);
    String appId = data.activeAppId;
    App app = data.apps[appId];

    return Stack(
      children: <Widget>[
        Scaffold(
          body: Center(
              child: ListView.builder(
                  itemCount: app.uiSchema.order.length,
                  itemBuilder: (context, index) {
                    String componentId = app.uiSchema.order[index];
                    UIComponent component = app.uiSchema.components[componentId];

                    return ViewRenderer.getView(component, false);
                  }
              )
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 32, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black12,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
