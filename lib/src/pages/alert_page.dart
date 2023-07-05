import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert page')
      ),
      body: Center(
        child: FilledButton(
          onPressed: () => _showAlert(context), 
          child: const Text("Mostrar alerta"),
        ) 
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: const Text('Titulo'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('This is a box alert content'),
              FlutterLogo(size: 100.0)
            ],
          ),
          actions: <Widget>[
            FilledButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FilledButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      } 
    );
  }
}