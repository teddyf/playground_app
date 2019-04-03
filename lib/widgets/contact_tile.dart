import 'package:flutter/material.dart';

class ContactTile extends Container {
  ContactTile(String title, String subtitle)
      : super(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {}
      ),

      decoration: new BoxDecoration(
          border: new Border(
              bottom: BorderSide(color: Colors.black38)
          )
      )

  );
}