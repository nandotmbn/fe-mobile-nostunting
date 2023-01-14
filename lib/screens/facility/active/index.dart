import 'package:flutter/material.dart';
import 'package:no_stunting/widgets/bottom_nav_bar.dart';
import 'package:no_stunting/screens/facility/active/home/index.dart';
import 'package:no_stunting/screens/facility/active/measure/index.dart';
import 'package:no_stunting/screens/facility/active/monitor/index.dart';
import 'package:no_stunting/screens/facility/active/patient/index.dart';
import 'package:no_stunting/screens/facility/active/setting/index.dart';

class FacilityActive extends StatefulWidget {
  const FacilityActive({super.key});

  @override
  State<FacilityActive> createState() => _FacilityActiveState();
}

class _FacilityActiveState extends State<FacilityActive> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FacilityHome(),
    FacilityMeasure(),
    FacilityMonitor(),
    FacilityPatient(),
    FacilitySetting(),
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
      bottomNavigationBar:
          CustomNavigationBar(_selectedIndex, setSelectedIndex),
    ));
  }
}
