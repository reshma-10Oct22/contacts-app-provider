import 'package:contactsapp_provider/components/contact_card.dart';
import 'package:flutter/material.dart';
import '../model/contact.dart';
import 'detail_screen.dart';

class AllContactScreen extends StatelessWidget {
  final List<Contact> allContactList;
  final void Function(Contact) onEdit;
  const AllContactScreen({
    super.key,
    required this.allContactList,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    print(allContactList.length);
    return allContactList.isEmpty
        ? const Center(
            child: Text("No contacts, click + to add contact"),
          )
        : ListView.builder(
            itemCount: allContactList.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen(
                          contact: allContactList[index],
                          onEdit: onEdit,
                        );
                      },
                    ),
                  );
                },
                child: ContactCard(
                  contact: allContactList[index],
                  onEdit: onEdit,
                ),
              );
            },
          );
  }
}
