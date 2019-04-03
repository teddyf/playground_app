import 'package:flutter/material.dart';
import 'package:playground_app/models/contact.dart';
import 'package:playground_app/services/contact-service.dart';
import 'package:playground_app/pages/detail_page.dart';
import 'package:playground_app/singleton.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  ContactPageState createState() => new ContactPageState();
}

class ContactPageState extends State<ContactPage> {

  String _query = "";
  List<Contact> contacts = [];

  void _setQuery(String query) {
    setState(() {
      _query = query;
    });
  }

  Future<List<Contact>> getContacts() {
    if(_query == "") {
      return ContactService().getContacts();
    }
    else {
      return ContactService().searchContacts(_query.toLowerCase());
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              title: new Text("Contacts"),
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: Icon(Icons.search, color: Colors.white),
                  title: TextField(
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) {
                      _setQuery(value);
                    },
                  )
              ),
            ),
          ];
        },
        body: new FutureBuilder(
            future: getContacts(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return new Container(
                      child: _buildListView(snapshot.data, context)
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
      )
    );
  }

  Widget _buildListView(list, context) {
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
      Singleton.setIndex(index);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => new DetailPage()));
    }
  );
}