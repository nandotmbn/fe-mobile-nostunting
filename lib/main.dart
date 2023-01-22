import 'package:flutter/material.dart';
import 'package:no_stunting/screens/choose_roles/choose_roles.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SafeArea(child: ChooseRolesLogin()),
    );
  }
}
