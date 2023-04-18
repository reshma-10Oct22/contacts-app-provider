import 'package:contactsapp_provider/model/service.dart';
import 'package:flutter/material.dart';
import '../model/contact.dart';

class ContactListProviderClass with ChangeNotifier {
  List<Contact> _allContactList = [];
  List<Contact> _favContactList = [];
  List<Contact> _otherContactList = [];

  List<Contact> get allContactList => _allContactList;
  List<Contact> get favContactList => _favContactList;

  void postContacts() {
    Contact contact1 = Contact(
      id: 1,
      firstName: "Reshma",
      lastName: "Suresh",
      phoneNumber: "122121212",
      emailId: "rs@gmail.com",
      isFav: true,
    );
    Contact contact2 = Contact(
      id: 2,
      firstName: "Sushma",
      lastName: "Suresh",
      phoneNumber: "2121212121",
      emailId: "ss@gmail.com",
      isFav: true,
    );
    Contact contact3 = Contact(
      id: 3,
      firstName: "Hema",
      lastName: "Suresh",
      phoneNumber: "2125512121",
      emailId: "hs@gmail.com",
      isFav: true,
    );
    Contact contact4 = Contact(
      id: 4,
      firstName: "Kalyani",
      lastName: "Srni",
      phoneNumber: "2121214565",
      emailId: "ks@gmail.com",
    );
    Contact contact5 = Contact(
      id: 5,
      firstName: "Mythili",
      lastName: "Sridhar",
      phoneNumber: "2121216865",
      emailId: "ms@gmail.com",
    );
    Contact contact6 = Contact(
      id: 6,
      firstName: "Suresh",
      lastName: "Narayana",
      phoneNumber: "4568934563",
      emailId: "sn@gmail.com",
      isFav: true,
    );
    Contact contact7 = Contact(
      id: 7,
      firstName: "Booma",
      lastName: "Nattu",
      phoneNumber: "2121212121",
      emailId: "bn@gmail.com",
    );
    Contact contact8 = Contact(
      id: 8,
      firstName: "Vidya",
      lastName: "Jay",
      phoneNumber: "9797212121",
      emailId: "vj@gmail.com",
    );
    Contact contact9 = Contact(
      id: 9,
      firstName: "Prabu",
      lastName: "Hala",
      phoneNumber: "5889212121",
      emailId: "ph@gmail.com",
    );
    Contact contact10 = Contact(
      id: 10,
      firstName: "Aakash",
      lastName: "Srini",
      phoneNumber: "5889215065",
      emailId: "as@gmail.com",
    );
    _allContactList.addAll([
      contact1,
      contact2,
      contact3,
      contact4,
      contact5,
      contact6,
      contact7,
      contact8,
      contact9,
      contact10,
    ]);
  }

  void updateContact() {
    for (Contact contact in _allContactList) {
      if (contact.isFav!) {
        _favContactList.add(contact);
      } else {
        _favContactList.remove(contact);
        _otherContactList.add(contact);
      }
    }
    _allContactList.clear();
    _allContactList.addAll(_favContactList);
    _allContactList.addAll(_otherContactList);
    notifyListeners();
  }

  void addContact(Contact contact) {
    _allContactList.add(contact);
    _favContactList.clear();
    _otherContactList.clear();
    updateContact();
    notifyListeners();
  }

  void editContact(Contact updatedContact) {
    for (Contact contact in _allContactList) {
      if (contact.id == updatedContact.id) {
        contact.firstName = updatedContact.firstName;
        contact.lastName = updatedContact.lastName;
        contact.phoneNumber = updatedContact.phoneNumber;
        contact.emailId = updatedContact.emailId;
        contact.isFav = updatedContact.isFav;
      }
    }
    _favContactList.clear();
    _otherContactList.clear();
    updateContact();
    notifyListeners();
  }
}
