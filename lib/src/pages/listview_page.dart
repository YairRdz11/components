import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<int> _numberList = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listas')
        ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return ListView.builder(
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