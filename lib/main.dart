import 'package:contactsapp_provider/screens/all_contacts_screen.dart';
import 'package:contactsapp_provider/screens/fav_contacts_screen.dart';
import 'package:contactsapp_provider/screens/body_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts App',
      home: const MyHomePage(title: "Contacts App"),
      debugShowCheckedModeBanner: false,
    );
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
