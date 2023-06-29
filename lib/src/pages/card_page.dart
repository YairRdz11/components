import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[_cardType1()],
      ),
    );
  }

  Widget _cardType1() {
    return Card(
      child: Column(
        children: <Widget> [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text("Soy el titulo"),
            subtitle: Text("kzksjkdksdkshkdhshdsjbxbsjbhxs lsjdhihciuior pkjfojroijfoijroi"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                onPressed: () {}, 
                child: Text("Cancel")
              ),
              TextButton(
                onPressed: () {}, 
                child: Text("OK")
              )
            ],
          )
        ]
      ),
    );
  }
}