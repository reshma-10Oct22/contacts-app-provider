import 'dart:async';
import 'package:contactsapp_provider/providers/fav_icon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/action_loader.dart';
import '../components/info_box.dart';
import '../model/contact.dart';
import '../providers/contact_list_provider.dart';

class AddContactScreen extends StatelessWidget {
  final int contactLength;
  final void Function(Contact) onAdd;
  AddContactScreen({
    super.key,
    required this.contactLength,
    required this.onAdd,
  });

  final TextEditingController firstNameCntrl = TextEditingController();

  final TextEditingController lastNameCntrl = TextEditingController();

  final TextEditingController phoneNumberCntrl = TextEditingController();

  final TextEditingController emailCntrl = TextEditingController();

  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    final contactListProvider =
        Provider.of<ContactListProviderClass>(context, listen: false);
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
                  Consumer<FavIconProviderClass>(
                    builder: (context, value, child) {
                      value.setFavIcon(isFav);
                      return GestureDetector(
                        child: value.favIcon,
                        onTap: () {
                          if (isFav) {
                            isFav = false;
                          } else {
                            isFav = true;
                          }
                          value.setFavIcon(isFav);
                        },
                      );
                    },
                  ),
                  TextButton(
                    onPressed: () {
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
                          !(emailCntrl.text.contains('@') &&
                              emailCntrl.text.contains("."))) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              actions: [
                                InfoBox(fieldName: "Phone Number and Email ID")
                              ],
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
                              actions: [
                                InfoBox(fieldName: "Email ID"),
                              ],
                            );
                          },
                        );
                      } else {
                        Contact addedContact = Contact(
                          id: contactListProvider.allContactList.length + 1,
                          firstName: firstNameCntrl.text,
                          lastName: lastNameCntrl.text,
                          phoneNumber: phoneNumberCntrl.text,
                          emailId: emailCntrl.text,
                          isFav: isFav,
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
                            contactListProvider.addContact(addedContact);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        );
                      }
                    },
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
}
