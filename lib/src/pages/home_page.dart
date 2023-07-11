import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _list(),
    );
  }
  
  Widget _list() {
    
    //menuProvider.loadData();

    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: ((context, snapshot) {
        return ListView(
          children: _buildListItems(snapshot.data, context),
        );
      }),
    );
  }

  List<Widget> _buildListItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> options = [];
    if(data == null)
      return options;

    data.forEach((element) {
      final widgetTmp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.amberAccent,),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
        },
      );
      options..add(widgetTmp)
            ..add(Divider());
    });

    return options;
  }
}