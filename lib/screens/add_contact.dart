import 'package:flutter/material.dart';
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
                        icon = isFavIcon;
                      } else {
                        icon = isNotFavIcon;
                      }
                      setState(() {});
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Contact addedContact = Contact(
                        id: widget.contactLength + 1,
                        firstName: firstNameCntrl.text,
                        lastName: lastNameCntrl.text,
                        phoneNumber: phoneNumberCntrl.text,
                        emailId: emailCntrl.text,
                        isFav: icon == isFavIcon ? true : false,
                      );
                      widget.onAdd(addedContact);
                      Navigator.of(context).pop(addedContact);
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
