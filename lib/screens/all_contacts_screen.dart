import 'package:contactsapp_provider/components/contact_card.dart';
import 'package:flutter/material.dart';
import '../model/contact.dart';
import 'detail_screen.dart';

class AllContactScreen extends StatefulWidget {
  final List<Contact> allContactList;
  final void Function(Contact) onEdit;
  const AllContactScreen({
    super.key,
    required this.allContactList,
    required this.onEdit,
  });

  @override
  State<AllContactScreen> createState() => _AllContactScreenState();
}

class _AllContactScreenState extends State<AllContactScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.allContactList.length);
    return ListView.builder(
      itemCount: widget.allContactList.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailScreen(
                    contact: widget.allContactList[index],
                    onEdit: widget.onEdit,
                  );
                },
              ),
            );
          },
          child: ContactCard(
            contact: widget.allContactList[index],
            onEdit: widget.onEdit,
          ),
        );
      },
    );
  }
}
