import 'package:flutter/material.dart';
import 'package:no_stunting/views/child/active/calendar/index.dart';
import 'package:no_stunting/views/child/active/home/index.dart';
import 'package:no_stunting/views/child/active/measurement/index.dart';
import 'package:no_stunting/views/child/active/setting/index.dart';
import 'package:no_stunting/widgets/bottom_nav_child.dart';
import 'package:no_stunting/widgets/bottom_nav_mother.dart';

class ChildActive extends StatefulWidget {
  const ChildActive({super.key});

  @override
  State<ChildActive> createState() => _ChildActiveState();
}

class _ChildActiveState extends State<ChildActive> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ChildHomeView(),
    ChildMeasurementView(),
    ChildCalendarView(),
    ChildSettingView()
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
      bottomNavigationBar: ChildNav(_selectedIndex, setSelectedIndex),
    ));
  }
}
