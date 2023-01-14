import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/measure/index.dart';

class FacilityMeasure extends StatefulWidget {
  const FacilityMeasure({super.key});

  @override
  State<FacilityMeasure> createState() => _FacilityMeasureState();
}

class _FacilityMeasureState extends State<FacilityMeasure> {
  int _selectedIndex = 0;

  void setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FacilityMeasureView(_selectedIndex, setSelectedIndex);
  }
}
