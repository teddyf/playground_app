import 'package:playground_app/models/contact.dart';

class ContactService {

  Future<List<Contact>> getContacts() {
    return Future.value(allContacts);
  }
}

List<Contact> allContacts = [
  Contact(name: 'Teddy Franceschi', email: 'ttf6@duke.edu', number: '(585)797-9725', imageUrl: 'playground_app/images/Teddy.jpg'),
  Contact(name: 'Willie Franceschi', email: 'whf3@jhu.edu', number: '(585)794-6700'),
  Contact(name: 'Filip Steilberg', email: 'bbc69@duke.edu', number: '(917)696-9696'),
];