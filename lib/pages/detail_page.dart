import 'package:flutter/material.dart';
import 'package:playground_app/models/contact.dart';
import 'package:playground_app/widgets/contact_icon.dart';
import 'package:playground_app/services/contact-service.dart';
import 'package:playground_app/widgets/contact_tile.dart';
import 'package:playground_app/controller.dart';

class DetailPage extends StatelessWidget {
  PageController controller = new PageController(initialPage: Controller().getIndex());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new FutureBuilder(
        future: ContactService().getContacts(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return new Container(
                  child: _buildContent(snapshot.data)
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
      ),
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
          Padding(
            padding: const EdgeInsets.all(35.0),
          ),
          CircleAvatar(
              child: Text(contact.name[0], style: new TextStyle(
                fontSize: 30,
              )),
              radius: 40,
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
              ContactIcon(Icons.message, "message", Colors.blue),
              Spacer(),
              ContactIcon(Icons.phone, "call", Colors.blue),
              Spacer(),
              ContactIcon(Icons.videocam, "video", Colors.blue),
              Spacer(),
              ContactIcon(Icons.mail_outline, "mail", Colors.blue),
              Spacer(),
              ContactIcon(Icons.attach_money, "pay", Colors.blue),
              Spacer(),
            ],

          ),
          ContactTile("message", contact.number, () => {}),
          ContactTile("mail", contact.email, () => {})


        ],
      )
    );
}
