import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/monitor/calendar.dart';
// import 'package:no_stunting/views/facility/active/measure/record.dart';
import 'package:no_stunting/widgets/base_scaffold.dart';

class FacilityMonitorDetailMother extends StatefulWidget {
  final String _id;
  // ignore: use_key_in_widget_constructors
  const FacilityMonitorDetailMother(this._id);

  @override
  State<FacilityMonitorDetailMother> createState() =>
      _FacilityMonitorDetailMotherState();
}

class _FacilityMonitorDetailMotherState
    extends State<FacilityMonitorDetailMother> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(FacilityMonitorCalendar(
      id: widget._id,
      role: "Ibu",
      type: "Monitor",
    ));
  }
}
