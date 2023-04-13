import 'dart:async';

import 'package:contactsapp_provider/components/action_loader.dart';
import 'package:contactsapp_provider/components/info_box.dart';
import 'package:flutter/material.dart';
import '../model/contact.dart';

class DetailScreen extends StatefulWidget {
  final Contact contact;
  final void Function(Contact contact) onEdit;
  const DetailScreen({
    super.key,
    required this.contact,
    required this.onEdit,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController firstNameCntrl = TextEditingController();
  TextEditingController lastNameCntrl = TextEditingController();
  TextEditingController phoneNumberCntrl = TextEditingController();
  TextEditingController emailCntrl = TextEditingController();
  Icon isNotFavIcon = const Icon(Icons.favorite_border);
  Icon isFavIcon = const Icon(Icons.favorite);
  late Icon icon;

  @override
  void initState() {
    super.initState();
    icon = widget.contact.isFav! ? isFavIcon : isNotFavIcon;
    firstNameCntrl.text = widget.contact.firstName;
    lastNameCntrl.text = widget.contact.lastName;
    phoneNumberCntrl.text = widget.contact.phoneNumber;
    emailCntrl.text = widget.contact.emailId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          widget.contact.getFullName(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: Row(
                children: [
                  GestureDetector(
                    child: icon,
                    onTap: () {
                      if (icon == isNotFavIcon) {
                        icon = isFavIcon;
                      } else {
                        icon = isNotFavIcon;
                      }
                      setState(() {});
                    },
                  ),
                  TextButton(
                    onPressed: onContactEdit,
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          TextEditingController().clear();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50,
                    child: Text(
                      (widget.contact.firstName[0] + widget.contact.lastName[0])
                          .toUpperCase(),
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "First Name: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: firstNameCntrl,
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Last Name: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: lastNameCntrl,
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Phone Number: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: phoneNumberCntrl,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 30),
                const Text(
                  "Email: ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: emailCntrl,
                  keyboardType: TextInputType.emailAddress,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onContactEdit() {
    if (firstNameCntrl.text.isEmpty &&
        phoneNumberCntrl.text.isEmpty &&
        emailCntrl.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            actions: [
              InfoBox(fieldName: "Contact, fields are empty"),
            ],
          );
        },
      );
    } else if (phoneNumberCntrl.text.length != 10 &&
        !emailCntrl.text.contains('@') &&
        !emailCntrl.text.contains(".")) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            actions: [InfoBox(fieldName: "Phone Number and Email ID")],
          );
        },
      );
    } else if (phoneNumberCntrl.text.length != 10) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            actions: [InfoBox(fieldName: "Phone Number")],
          );
        },
      );
    } else if (!emailCntrl.text.contains('@') &&
        !emailCntrl.text.contains(".")) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            actions: [InfoBox(fieldName: "Email ID")],
          );
        },
      );
    } else {
      Contact updatedContact = Contact(
        id: widget.contact.id,
        firstName: firstNameCntrl.text,
        lastName: lastNameCntrl.text,
        phoneNumber: phoneNumberCntrl.text,
        emailId: emailCntrl.text,
        isFav: icon == isFavIcon ? true : false,
      );
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            actions: [ActionLoader()],
          );
        },
      );
      Timer(
        const Duration(seconds: 2),
        () {
          widget.onEdit(updatedContact);
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    }
  }
}
