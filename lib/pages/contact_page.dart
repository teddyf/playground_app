import 'package:flutter/material.dart';
import 'package:playground_app/models/contact.dart';

class ContactPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
        itemCount: allContacts.length,
        itemBuilder: (BuildContext content, int index) {
          Contact contact = allContacts[index];
          return ContactListTile(contact);
        });
  }
}

class ContactListTile extends ListTile {
  ContactListTile(Contact contact)
      : super(
    title: Text(contact.name),
    subtitle: Text(contact.number),
    leading: CircleAvatar(child: Text(contact.name[0])),
    onTap: () => {
    }
  );
}

List<Contact> allContacts = [
  Contact(name: 'Teddy Franceschi', email: 'ttf6@duke.edu', number: '(585)797-9725', imageUrl: 'playground_app/images/Teddy.jpg'),
  Contact(name: 'Willie Franceschi', number: '(585)794-6700'),
  Contact(name: 'Filip Steilber', number: '(917)696-9696')
];