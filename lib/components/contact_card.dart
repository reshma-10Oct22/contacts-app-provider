import 'package:flutter/material.dart';
import '../model/contact.dart';

class ContactCard extends StatefulWidget {
  final Contact contact;
  final void Function(Contact) onEdit;
  const ContactCard({super.key, required this.contact, required this.onEdit});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  Icon isFav = const Icon(Icons.favorite);
  Icon isNotFav = const Icon(Icons.favorite_border_outlined);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              GestureDetector(
                child: widget.contact.isFav! ? isFav : isNotFav,
                onTap: () {
                  if (widget.contact.isFav!) {
                    widget.contact.isFav = false;
                  } else {
                    widget.contact.isFav = true;
                  }
                  Contact updatedContact = Contact(
                    id: widget.contact.id,
                    firstName: widget.contact.firstName,
                    lastName: widget.contact.lastName,
                    phoneNumber: widget.contact.phoneNumber,
                    emailId: widget.contact.emailId,
                    isFav: widget.contact.isFav,
                  );
                  widget.onEdit(updatedContact);
                  setState(() {});
                },
              ),
              const SizedBox(width: 20),
              CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 30,
                child: Text(
                  (widget.contact.firstName[0] + widget.contact.lastName[0])
                      .toUpperCase(),
                  style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contact.getFullName(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.contact.phoneNumber,
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.call),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
