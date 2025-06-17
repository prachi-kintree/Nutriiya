import 'package:flutter_contacts/flutter_contacts.dart';

class ContactHelper {
  Future<Contact?> getSelectedContact() async {
    bool hasAccess = await FlutterContacts.requestPermission();
    if (hasAccess) {
      Contact? contact = await FlutterContacts.openExternalPick();

      return contact;
    } else {
      return null;
    }
  }
}
