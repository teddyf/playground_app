import 'package:flutter/material.dart';

class ContactTile extends Container {
  ContactTile(String title, String subtitle, Function func)
      : super(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: func
      ),

      decoration: new BoxDecoration(
          border: new Border(
              bottom: BorderSide(color: Colors.black38)
          )
      )


  );
}