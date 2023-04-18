import 'package:contactsapp_provider/providers/contact_list_provider.dart';
import 'package:contactsapp_provider/providers/fav_icon_provider.dart';
import 'package:contactsapp_provider/providers/tab_index_provider.dart';
import 'package:contactsapp_provider/screens/all_contacts_screen.dart';
import 'package:contactsapp_provider/screens/fav_contacts_screen.dart';
import 'package:contactsapp_provider/screens/body_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => TabIndexProviderClass(),
          ),
          ChangeNotifierProvider(
            create: (_) => ContactListProviderClass(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavIconProviderClass(),
          ),
        ],
        child: const MaterialApp(
          title: 'Contacts App',
          home: MyHomePage(title: "Contacts App"),
          debugShowCheckedModeBanner: false,
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return BodyScreen();
  }
}
