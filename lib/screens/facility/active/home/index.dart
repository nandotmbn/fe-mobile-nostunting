import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/home/index.dart';
import 'package:no_stunting/views/facility/active/mother-monitoring/index.dart';

class FacilityHome extends StatefulWidget {
  const FacilityHome({super.key});

  @override
  State<FacilityHome> createState() => _FacilityHomeState();
}

class _FacilityHomeState extends State<FacilityHome> {
  int _selectedIndex = 0;
  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // static List<Widget> widgetOptions = <Widget>[
  //   FacilityHomeView(_selectedIndex, setSelectedIndex),
  //   MotherMonitoringView(_selectedIndex, setSelectedIndex)
  // ];

  Widget takeBuild(setIndex, index) {
    if (index == 0) {
      return FacilityHomeView(0, setSelectedIndex);
    } else if (index == 1) {
      return MotherMonitoringView(1, setSelectedIndex);
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return takeBuild(setSelectedIndex, _selectedIndex);
  }
}
