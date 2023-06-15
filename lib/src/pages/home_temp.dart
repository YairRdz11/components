import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp1'),
      ),
      body: ListView(
        children: _buildShortItems(),
      ),
    );
  }
  
  List<Widget> _buildItems(){
    List<Widget> list = [];

    for(var opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      list..add(tempWidget)
          ..add(Divider());
    }
    return list;
  }

  List<Widget> _buildShortItems() {
    var widgets = options.map((x) {
      return ListTile(
        title: Text(x),
      );
    }).toList();

    return widgets;
  }
}