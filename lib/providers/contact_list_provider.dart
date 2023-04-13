import 'package:contactsapp_provider/model/service.dart';
import 'package:flutter/material.dart';
import '../model/contact.dart';

class ContactListProvider with ChangeNotifier {
  List<Contact> _contactList = ContactService().getContactList();
}
