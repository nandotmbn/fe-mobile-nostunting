import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/monitor/calendar.dart';
// import 'package:no_stunting/views/facility/active/measure/record.dart';
import 'package:no_stunting/widgets/base_scaffold.dart';

class FacilityChildRecordDetail extends StatefulWidget {
  final String _id;
  // ignore: use_key_in_widget_constructors
  const FacilityChildRecordDetail(this._id);

  @override
  State<FacilityChildRecordDetail> createState() =>
      _FacilityChildRecordDetailState();
}

class _FacilityChildRecordDetailState extends State<FacilityChildRecordDetail> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(FacilityMonitorCalendar(
      id: widget._id,
      role: "Adik",
      type: "Record",
    ));
  }
}
