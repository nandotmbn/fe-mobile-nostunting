// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MotherCalendarView extends StatefulWidget {
  const MotherCalendarView({super.key});
  @override
  State<MotherCalendarView> createState() => _MotherCalendarViewState();
}

class _MotherCalendarViewState extends State<MotherCalendarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Kalender Ibu"),
    );
  }
}
