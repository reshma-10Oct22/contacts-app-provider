import 'package:flutter/material.dart';
import '../components/contact_card.dart';
import '../model/contact.dart';
import 'detail_screen.dart';

class FavContactsScreen extends StatelessWidget {
  final List<Contact> favContactsList;
  final void Function(Contact) onEdit;
  const FavContactsScreen({
    super.key,
    required this.favContactsList,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    print(favContactsList.length);
    return favContactsList.isEmpty
        ? const Center(
            child: Text("No contacts added in favourites"),
          )
        : ListView.builder(
            itemCount: favContactsList.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailScreen(
                          contact: favContactsList[index],
                          onEdit: onEdit,
                        );
                      },
                    ),
                  );
                },
                child: ContactCard(
                  contact: favContactsList[index],
                  onEdit: onEdit,
                ),
              );
            },
          );
  }
}
