import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/monitor/calendar.dart';
// import 'package:no_stunting/views/facility/active/measure/record.dart';
import 'package:no_stunting/widgets/base_scaffold.dart';

class FacilityMonitorDetailChild extends StatefulWidget {
  final String _id;
  // ignore: use_key_in_widget_constructors
  const FacilityMonitorDetailChild(this._id);

  @override
  State<FacilityMonitorDetailChild> createState() =>
      _FacilityMonitorDetailChildState();
}

class _FacilityMonitorDetailChildState
    extends State<FacilityMonitorDetailChild> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(FacilityMonitorCalendar(
      id: widget._id,
      role: "Adik",
      type: "Monitor",
    ));
  }
}
