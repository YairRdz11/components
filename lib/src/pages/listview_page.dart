import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _sc = ScrollController();
  List<int> _numberList = [];
  int _lastNumber = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addTen();
    _sc.addListener(() {
      if(_sc.position.pixels == _sc.position.maxScrollExtent){
        _addTen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas')
        ),
      body: _createList(),
    );
  }

  void _addTen() {
    for(var i = 1; i < 10; i++) {
      _lastNumber++;
      _numberList.add(_lastNumber);
    }
    setState(() {
      
    });
  }

  Widget _createList() {
    return ListView.builder(
      controller: _sc,
      itemCount: _numberList.length,
      itemBuilder: (BuildContext context, int index) {
        final image = _numberList[index];
        return FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://picsum.photos/500/300?image=$image')
          );
      },
    );
  }
}