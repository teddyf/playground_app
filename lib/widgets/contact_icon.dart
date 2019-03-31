import 'package:flutter/material.dart';

class ContactIcon extends Container {
  ContactIcon(IconData icon, String text, Color color)
      : super(
    child: Column(
        children: <Widget>[
          GestureDetector(
            child: Icon(icon, color: color),
            onTap: () => {
            },
          ),
          Text(text, style: new TextStyle(color: color))
        ]
    )

  );
}