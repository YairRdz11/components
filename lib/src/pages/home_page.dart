import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

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
          children: _buildListItems(snapshot.data),
        );
      }),
    );
  }

  List<Widget> _buildListItems(List<dynamic>? data) {
    final List<Widget> options = [];
    if(data == null)
      return options;

    data.forEach((element) {
      final widgetTmp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.amberAccent,),
        onTap: () {},
      );
      options..add(widgetTmp)
            ..add(Divider());
    });

    return options;
  }
}