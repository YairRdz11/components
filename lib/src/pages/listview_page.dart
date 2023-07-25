import 'dart:async';

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
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _addTen();
    _sc.addListener(() {
      if(_sc.position.pixels == _sc.position.maxScrollExtent){
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _sc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas')
        ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ]
        )
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

  Future<Timer> _fetchData() async {
    _isLoading = true;
    setState(() { });
    final duration = Duration(seconds: 2);
    return Timer(duration, _httpResponse);
  }

  _httpResponse() {
    _isLoading = false;
    _sc.animateTo(
      _sc.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(microseconds: 250)
    );
    _addTen();
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

  Widget _createLoading() {
    if(_isLoading)
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    return Container();
  }
}