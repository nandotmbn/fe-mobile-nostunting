import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/measure/record.dart';
import 'package:no_stunting/widgets/base_scaffold.dart';

class FacilityMeasureRecord extends StatefulWidget {
  final String _id;
  // ignore: use_key_in_widget_constructors
  const FacilityMeasureRecord(this._id);

  @override
  State<FacilityMeasureRecord> createState() => _FacilityMeasureRecordState();
}

class _FacilityMeasureRecordState extends State<FacilityMeasureRecord> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(FaciliityMeasureRecordView(widget._id));
  }
}
