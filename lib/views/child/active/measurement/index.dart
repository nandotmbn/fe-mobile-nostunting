// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ChildMeasurementView extends StatefulWidget {
  const ChildMeasurementView({super.key});
  @override
  State<ChildMeasurementView> createState() => _ChildMeasurementViewState();
}

class _ChildMeasurementViewState extends State<ChildMeasurementView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Child Measurement"),
    );
  }
}
