// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/views/facility/active/measure/partials/patients_detail.dart';
import 'package:no_stunting/views/facility/active/measure/partials/record_form.dart';

class FaciliityMeasureRecordView extends StatefulWidget {
  final String _id;
  FaciliityMeasureRecordView(this._id);

  @override
  State<FaciliityMeasureRecordView> createState() =>
      _FaciliityMeasureRecordViewState();
}

class _FaciliityMeasureRecordViewState
    extends State<FaciliityMeasureRecordView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(children: [
        Expanded(
          flex: 2,
          child: FacilityMeasurePatientDetail(widget._id),
        ),
        Expanded(
            flex: 10,
            child: Container(
              margin: const EdgeInsets.only(top: 24),
              decoration: BoxDecoration(
                color: MyColor.level1,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                  child: FacilityMeasureRecordForm(
                id: widget._id,
              )),
            ))
      ]),
    );
  }
}
