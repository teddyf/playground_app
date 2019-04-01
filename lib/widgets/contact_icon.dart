import 'package:flutter/material.dart';
import 'package:playground_app/url_launcher.dart';

class ContactIcon extends Container {
  ContactIcon(IconData icon, String text, Color color, String url)
      : super(
    child: Column(
        children: <Widget>[
          GestureDetector(
            child: Icon(icon, color: color),
            onTap: () {
              URLLauncher().launchURL(url);
            }
          ),
          Text(text, style: new TextStyle(color: color))
        ]
    )

  );
}