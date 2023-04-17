import 'package:contactsapp_provider/providers/tab_index_provider.dart';
import 'package:contactsapp_provider/screens/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  List<Contact> allContactList = [];
  List<Contact> favContactsList = [];
  List<Contact> otherContactList = [];
  ContactService contactService = ContactService();
  @override
  void initState() {
    super.initState();
    contactService.addContact();
    allContactList = contactService.getContactList();
    _getContacts();
  }

  @override
  Widget build(BuildContext context) {
    print("main build");
    final tabIndexProvider =
        Provider.of<TabIndexProviderClass>(context, listen: false);
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
      bottomNavigationBar: Consumer<TabIndexProviderClass>(
        builder: (context, value, child) {
          return BottomNavigationBar(
            currentIndex: value.tabIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            onTap: (newTabIndex) {
              value.setTabIndex(newTabIndex);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Favourites",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                label: "Contacts",
              ),
            ],
          );
        },
      ),
    );
  }

  Widget returnBodyWidget() {
    return Consumer<TabIndexProviderClass>(
      builder: (context, value, child) {
        if (value.tabIndex == 0) {
          return FavContactsScreen(
              favContactsList: favContactsList, onEdit: _onEdit);
        } else {
          return AllContactScreen(
            allContactList: allContactList,
            onEdit: _onEdit,
          );
        }
      },
    );
  }

  void onAdd(Contact addedContact) {
    setState(() {
      allContactList.add(addedContact);
      favContactsList.clear();
      otherContactList.clear();
      _getContacts();
    });
  }

  void _getContacts() {
    for (Contact contact in allContactList) {
      if (contact.isFav!) {
        favContactsList.add(contact);
      } else {
        favContactsList.remove(contact);
        otherContactList.add(contact);
      }
    }
    allContactList.clear();
    allContactList.addAll(favContactsList);
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
    setState(() {
      favContactsList.clear();
      otherContactList.clear();
      _getContacts();
    });
  }
}
