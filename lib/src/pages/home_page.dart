import 'package:components/src/providers/menu_provider.dart';
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
    print(menuProvider.options);
    return ListView(
      children: _buildListItems(),
    );
  }

  List<Widget> _buildListItems() {
    return [
      ListTile(title: Text('Hola mundo'),),
      ListTile(title: Text('Hola mundo'),),
      ListTile(title: Text('Hola mundo'),),
      ListTile(title: Text('Hola mundo'),),
    ];
  }
}