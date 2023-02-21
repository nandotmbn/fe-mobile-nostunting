import 'package:flutter/material.dart';
import 'package:no_stunting/widgets/bottom_nav_bar.dart';
import 'package:no_stunting/widgets/bottom_nav_mother.dart';
import 'package:no_stunting/screens/facility/active/home/index.dart';
import 'package:no_stunting/views/mother/active/home/index.dart';

class MotherHome extends StatefulWidget {
  const MotherHome({super.key});

  @override
  State<MotherHome> createState() => _MotherHomeState();
}

class _MotherHomeState extends State<MotherHome> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[MotherHomeView()];

  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: MotherNav(_selectedIndex, setSelectedIndex),
    ));
  }
}
