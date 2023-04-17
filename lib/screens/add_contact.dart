import 'dart:async';

import 'package:flutter/material.dart';
import '../components/action_loader.dart';
import '../components/info_box.dart';
import '../model/contact.dart';

class AddContactScreen extends StatefulWidget {
  final int contactLength;
  final void Function(Contact) onAdd;
  const AddContactScreen({
    super.key,
    required this.contactLength,
    required this.onAdd,
  });

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  Icon isNotFavIcon = const Icon(Icons.favorite_border);
  Icon isFavIcon = const Icon(Icons.favorite);
  late Icon icon;
  TextEditingController firstNameCntrl = TextEditingController();
  TextEditingController lastNameCntrl = TextEditingController();
  TextEditingController phoneNumberCntrl = TextEditingController();
  TextEditingController emailCntrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    icon = isNotFavIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: const Text("New Contact"),
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
                        setState(() {
                          icon = isFavIcon;
                        });
                      } else {
                        setState(() {
                          icon = isNotFavIcon;
                        });
                      }
                    },
                  ),
                  TextButton(
                    onPressed: onAddContact,
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                "First Name: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: firstNameCntrl,
              ),
              const SizedBox(height: 30),
              const Text(
                "Last Name: ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: lastNameCntrl,
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
    );
  }

  void onAddContact() {
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
        !(emailCntrl.text.contains('@') && emailCntrl.text.contains("."))) {
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
    } else if (!(emailCntrl.text.contains('@') &&
        emailCntrl.text.contains("."))) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            actions: [InfoBox(fieldName: "Email ID")],
          );
        },
      );
    } else {
      Contact addedContact = Contact(
        id: widget.contactLength + 1,
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
          widget.onAdd(addedContact);
          Navigator.pop(context);
          Navigator.pop(context);
        },
      );
    }
  }
}
