import 'package:flutter/material.dart';
import 'package:no_stunting/widgets/bottom_nav_bar.dart';
import 'package:no_stunting/widgets/bottom_nav_mother.dart';
import 'package:no_stunting/screens/facility/active/home/index.dart';
import 'package:no_stunting/views/mother/active/home/index.dart';

class HomeMother extends StatefulWidget {
  const HomeMother({super.key});

  @override
  State<HomeMother> createState() => _HomeMotherState();
}

class _HomeMotherState extends State<HomeMother> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeMotherView() //Widget Home
  ];

  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFF4E6C50),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: MotherNav(_selectedIndex, setSelectedIndex),
    ));
  }
}
