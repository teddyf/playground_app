import 'package:flutter/material.dart';
import 'package:playground_app/models/contact.dart';
import 'package:playground_app/widgets/contact_icon.dart';
import 'package:playground_app/services/contact-service.dart';
import 'package:playground_app/widgets/contact_tile.dart';
import 'package:playground_app/singleton.dart';


class DetailPage extends StatelessWidget {
  PageController controller = new PageController(initialPage: Singleton.getIndex());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(color: Colors.blue),
        elevation: 0,
      ),
      body: _buildContent(ContactService().getContacts()),
    );
  }

  Widget _buildContent(snapshot) {
    return PageView.builder(
        controller: controller,
        itemCount: snapshot.length,
        itemBuilder: (BuildContext content, index) {
          Contact contact = snapshot[index];
          return DetailCard(contact);
        });
  }
}

class DetailCard extends Container {
  DetailCard(Contact contact)
    : super(
      child: Column(
        children: <Widget>[
          CircleAvatar(
              child: Text(contact.name[0], style: new TextStyle(
                fontSize: 30,
              )),
              radius: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
          ),
          Title(
            child: Text(contact.name, style: new TextStyle(
              fontSize: 30,
            )),
            color: Colors.black
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
          ),
          Row(
            children: <Widget>[
              Spacer(),
              ContactIcon(Icons.message, "message", Colors.blue, "sms://${contact.number}"),
              Spacer(),
              ContactIcon(Icons.phone, "call", Colors.blue, "tel:${contact.number}"),
              Spacer(),
              ContactIcon(Icons.mail_outline, "mail", Colors.blue, "mailto://${contact.email}"),
              Spacer(),
            ],

          ),
          ContactTile("message", contact.number),
          ContactTile("mail", contact.email)


        ],
      )
    );
}

