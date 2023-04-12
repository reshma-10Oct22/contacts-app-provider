import 'package:flutter/material.dart';
import '../components/contact_card.dart';
import '../model/contact.dart';
import 'detail_screen.dart';

class FavContactsScreen extends StatefulWidget {
  final List<Contact> favContactsList;
  final void Function(Contact) onEdit;
  const FavContactsScreen({
    super.key,
    required this.favContactsList,
    required this.onEdit,
  });

  @override
  State<FavContactsScreen> createState() => _FavContactsScreenState();
}

class _FavContactsScreenState extends State<FavContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.favContactsList.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(
                      contact: widget.favContactsList[index],
                      onEdit: widget.onEdit,
                    );
                  },
                ),
              );
            },
            child: ContactCard(
              contact: widget.favContactsList[index],
              onEdit: widget.onEdit,
            ));
      },
    );
  }
}
