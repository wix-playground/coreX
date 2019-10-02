import 'package:core_x/data-layer/data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AppListScreen extends StatelessWidget {
  final items = List<String>.generate(
    4,
    (i) => "$i",
  );

  List<App> _getApps(context) {
    if (Provider.of<Data>(context).apps == null) {
      return null;
    }
    return Provider.of<Data>(context).apps.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    var apps = this._getApps(context);

    if (apps == null) {
      return Scaffold(
        body: Text('Loading'),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Core X '),
      ),
      body: ListView.builder(
          itemCount: apps.length,
          itemBuilder: (context, index) {
            final item = apps[index];

            return FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/editor', arguments: item.id);
                },
                child: Text(item.title,
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
