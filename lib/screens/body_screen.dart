import 'package:contactsapp_provider/screens/add_contact.dart';
import 'package:flutter/material.dart';
import '../model/contact.dart';
import '../model/service.dart';
import 'all_contacts_screen.dart';
import 'fav_contacts_screen.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  late Widget bodyWidget;
  int tabIndex = 1;
  List<Contact> allContactList = [];
  List<Contact> favContactList = [];
  List<Contact> otherContactList = [];
  ContactService contactService = ContactService();
  @override
  void initState() {
    super.initState();
    contactService.addContact();
    allContactList = contactService.getContactList();
    _getContacts();
    bodyWidget = AllContactScreen(
      allContactList: allContactList,
      onEdit: _onEdit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts App"),
      ),
      body: returnBodyWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddContactScreen(
                contactLength: allContactList.length,
                onAdd: onAdd,
              );
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: const Icon(Icons.star),
              onTap: () {
                tabIndex = 0;
                print(tabIndex);

                setState(() {});
              },
            ),
            label: "Favourites",
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: const Icon(Icons.contacts),
              onTap: () {
                tabIndex = 1;
                print(tabIndex);

                setState(() {});
              },
            ),
            label: "Contacts",
          ),
        ],
      ),
    );
  }

  Widget returnBodyWidget() {
    if (tabIndex == 0) {
      bodyWidget = FavContactsScreen(
        favContactsList: favContactList,
        onEdit: _onEdit,
      );
    } else {
      bodyWidget = AllContactScreen(
        allContactList: allContactList,
        onEdit: _onEdit,
      );
    }
    setState(() {});
    return bodyWidget;
  }

  void onAdd(Contact addedContact) {
    allContactList.add(addedContact);
    favContactList.clear();
    otherContactList.clear();
    _getContacts();

    setState(() {});
  }

  void _getContacts() {
    for (Contact contact in allContactList) {
      if (contact.isFav!) {
        favContactList.add(contact);
      } else {
        favContactList.remove(contact);
        otherContactList.add(contact);
      }
    }
    allContactList.clear();
    allContactList.addAll(favContactList);
    allContactList.addAll(otherContactList);
  }

  void _onEdit(Contact updatedContact) {
    int id = updatedContact.id;
    for (Contact contact in allContactList) {
      if (id == contact.id) {
        contact.firstName = updatedContact.firstName;
        contact.lastName = updatedContact.lastName;
        contact.phoneNumber = updatedContact.phoneNumber;
        contact.emailId = updatedContact.emailId;
        contact.isFav = updatedContact.isFav;
      }
    }
    favContactList.clear();
    otherContactList.clear();
    _getContacts();
    setState(() {});
  }
}
