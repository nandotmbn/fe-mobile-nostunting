// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ChildCalendarView extends StatefulWidget {
  const ChildCalendarView({super.key});
  @override
  State<ChildCalendarView> createState() => _ChildCalendarViewState();
}

class _ChildCalendarViewState extends State<ChildCalendarView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Child Calendar"),
    );
  }
}
