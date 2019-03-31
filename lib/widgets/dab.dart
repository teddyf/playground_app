import 'package:flutter/material.dart';


class Dab extends StatefulWidget {

  @override
  _DabState createState() => _DabState();
}

class _DabState extends State<Dab> {
  Brightness brightness;
  int _counter = 0;
  double _width = 0;

  void _increment() {
    setState(() {
      _counter+=2;
      brightness = Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      width: 100,
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        RaisedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
        Text('Count: $_counter'),
        Slider(
          min: 0,
          max: 255,
          label: "Color",
          onChanged: (newWidth) {
            setState(() => _width = newWidth);
          },
          value: _width
        )
        ],
      )
    );
  }
}

