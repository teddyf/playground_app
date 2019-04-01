import 'package:playground_app/models/contact.dart';

class ContactService {

  Future<List<Contact>> getContacts() {
    return Future.value(allContacts);
  }
}

List<Contact> allContacts = [
  Contact(name: 'Teddy Franceschi', email: 'ttf6@duke.edu', number: '5857979725', imageUrl: 'playground_app/images/Teddy.jpg'),
  Contact(name: 'Willie Franceschi', email: 'whf3@jhu.edu', number: '5857946700'),
  Contact(name: 'Filip Steilberg', email: 'bbc69@duke.edu', number: '9176969696'),
];