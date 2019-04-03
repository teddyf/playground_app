import 'package:playground_app/models/contact.dart';

class ContactService {

  Future<List<Contact>> getContacts() {
    return Future.value(allContacts);
  }

  Future<List<Contact>> searchContacts(String filter) {
    List<Contact> results= [];
    for(Contact contact in allContacts) {

      if (contact.name.toLowerCase().contains(filter) || contact.email.toLowerCase().contains(filter) ||
          contact.number.contains(filter)) {
        results.add(contact);
      }
    }

    return Future.value(results);
  }

  int getIndex(Contact contact) {
    return allContacts.indexOf(contact);
  }
}

List<Contact> allContacts = [
  Contact(name: 'Teddy Franceschi', email: 'ttf6@duke.edu', number: '5857979725'),
  Contact(name: 'Willie Franceschi', email: 'whf3@jhu.edu', number: '5857946700'),
  Contact(name: 'Eric Cartman', email: 'bbc69@duke.edu', number: '0123456789'),
  Contact(name: 'Kyle Broflovski', email: 'bbc69@duke.edu', number: '0123456789'),
  Contact(name: 'Stan Marsh', email: 'bbc69@duke.edu', number: '0123456789'),
  Contact(name: 'Kenny McCormick', email: 'bbc69@duke.edu', number: '0123456789'),
  Contact(name: 'Scott Malkinson', email: 'bbc69@duke.edu', number: '0123456789'),
  Contact(name: 'Clyde Donovan', email: 'bbc69@duke.edu', number: '0123456789'),
  Contact(name: 'Craig Tucker', email: 'bbc69@duke.edu', number: '0123456789'),
  Contact(name: 'Heidi Turner', email: 'bbc69@duke.edu', number: '0123456789'),
  Contact(name: 'David Rodriguez', email: 'bbc69@duke.edu', number: '0123456789'),
  Contact(name: 'Chef', email: 'bbc69@duke.edu', number: '0123456789')
];