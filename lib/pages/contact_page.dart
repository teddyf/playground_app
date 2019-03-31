import 'package:flutter/material.dart';
import 'package:playground_app/models/contact.dart';
import 'package:playground_app/services/contact-service.dart';
import 'package:playground_app/pages/detail_page.dart';
import 'package:playground_app/controller.dart';

class ContactPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FutureBuilder(
        future: ContactService().getContacts(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return new Container(
              child: _buildContent(snapshot.data, context)
            );
          }
          else {
            return new ErrorWidget("Failed to load");
          }
        }
          else {
            return CircularProgressIndicator();
          }
        }
      )
    );
  }

  Widget _buildContent(list, context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext content, int index) {
          Contact contact = list[index];
          return ContactListTile(contact, context, index);
        });
  }
}

class ContactListTile extends ListTile {
  ContactListTile(Contact contact, BuildContext context, index)
      : super(
    title: Text(contact.name),
    subtitle: Text(contact.number),
    leading: CircleAvatar(child: Text(contact.name[0])),
    onTap: () {
      Controller().setIndex(index);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => new DetailPage()));
    }
  );
}