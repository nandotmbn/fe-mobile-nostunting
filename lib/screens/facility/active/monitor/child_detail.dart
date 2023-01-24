import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/monitor/calendar.dart';
// import 'package:no_stunting/views/facility/active/measure/record.dart';
import 'package:no_stunting/widgets/base_scaffold.dart';

class FacilityMonitorDetail extends StatefulWidget {
  final String _id;
  // ignore: use_key_in_widget_constructors
  const FacilityMonitorDetail(this._id);

  @override
  State<FacilityMonitorDetail> createState() => _FacilityMonitorDetailState();
}

class _FacilityMonitorDetailState extends State<FacilityMonitorDetail> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(FacilityMonitorCalendar(
      id: widget._id,
      mode: "Adik",
    ));
  }
}
