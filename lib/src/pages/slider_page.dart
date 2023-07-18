import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            Expanded(child: _createImage())
          ]
          ),
      ),
    );
  }
  
  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      divisions: 20,
      value: _valueSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (value) {
        setState(() {
          _valueSlider = value;
        });
      }
    );
  }
  
  Widget _createImage() {
    return Image(
      image: NetworkImage('https://th.bing.com/th/id/OIP.ATlVzuWBnf3-fkmwsWgxqAHaF7?pid=ImgDet&rs=1'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }
}