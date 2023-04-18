import 'package:contactsapp_provider/providers/contact_list_provider.dart';
import 'package:contactsapp_provider/providers/tab_index_provider.dart';
import 'package:contactsapp_provider/screens/add_contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/contact_card.dart';
import '../model/service.dart';
import 'detail_screen.dart';

class BodyScreen extends StatelessWidget {
  BodyScreen({super.key});
  final ContactService contactService = ContactService();

  @override
  Widget build(BuildContext context) {
    print("main build");
    final contactListProvider =
        Provider.of<ContactListProviderClass>(context, listen: false);
    contactListProvider.postContacts(); //hardcoding the contacts
    contactListProvider.updateContact(); //separating them as fav and non-fav
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts App"),
      ),
      body: returnBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddContactScreen(
                contactLength: contactListProvider.allContactList.length,
                onAdd: (contact) {
                  contactListProvider.addContact(contact);
                  contactListProvider.updateContact();
                },
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

  Widget returnBody() {
    return Consumer<TabIndexProviderClass>(
      builder: (context, value, child) {
        if (value.tabIndex == 0) {
          return Consumer<ContactListProviderClass>(
            builder: (context, value, child) {
              return value.favContactList.isEmpty
                  ? const Center(
                      child: Text("No contacts added in favourites"),
                    )
                  : ListView.builder(
                      itemCount: value.favContactList.length,
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailScreen(
                                    contact: value.favContactList[index],
                                    onEdit: value.editContact,
                                  );
                                },
                              ),
                            );
                          },
                          child: ContactCard(
                            contact: value.favContactList[index],
                            onEdit: value.editContact,
                          ),
                        );
                      },
                    );
            },
          );
        } else {
          return Consumer<ContactListProviderClass>(
            builder: (context, value, child) {
              return value.allContactList.isEmpty
                  ? const Center(
                      child: Text("No contacts, click + to add contact"),
                    )
                  : ListView.builder(
                      itemCount: value.allContactList.length,
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailScreen(
                                    contact: value.allContactList[index],
                                    onEdit: value.editContact,
                                  );
                                },
                              ),
                            );
                          },
                          child: ContactCard(
                            contact: value.allContactList[index],
                            onEdit: value.editContact,
                          ),
                        );
                      },
                    );
            },
          );
        }
      },
    );
  }
}
