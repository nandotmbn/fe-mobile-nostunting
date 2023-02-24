import 'package:flutter/material.dart';
import 'package:no_stunting/views/mother/active/calendar/index.dart';
import 'package:no_stunting/views/mother/active/setting/index.dart';
import 'package:no_stunting/widgets/bottom_nav_mother.dart';
import 'package:no_stunting/views/mother/active/home/index.dart';

class MotherActive extends StatefulWidget {
  const MotherActive({super.key});

  @override
  State<MotherActive> createState() => _MotherActiveState();
}

class _MotherActiveState extends State<MotherActive> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MotherHomeView(),
    MotherCalendarView(),
    MotherSettingView()
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: MotherNav(_selectedIndex, setSelectedIndex),
    ));
  }
}
