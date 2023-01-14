// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:no_stunting/services/facility_measure.dart';
import 'package:no_stunting/views/facility/active/measure/partials/card_list_patient.dart';
import 'package:no_stunting/views/facility/active/measure/partials/search_bar.dart';

const storage = FlutterSecureStorage();
FacilityMeasureService facilityService = FacilityMeasureService();

class Tag {
  String firstName, lastName, identifier, _id, updatedAt;

  Tag(this.firstName, this.lastName, this.identifier, this._id, this.updatedAt);

  factory Tag.fromJson(dynamic json) {
    return Tag(
        json['firstName'] as String,
        json['lastName'] as String,
        json['identifier'] as String,
        json['_id'] as String,
        json['updatedAt'] as String);
  }

  @override
  String toString() {
    return '{ $firstName, $lastName, $identifier, $_id,}';
  }
}

class FacilityMeasureView extends StatefulWidget {
  final int selectedIndex;
  final Function setSelectedIndex;
  const FacilityMeasureView(this.selectedIndex, this.setSelectedIndex);

  @override
  State<FacilityMeasureView> createState() => _FacilityMeasureViewState();
}

class _FacilityMeasureViewState extends State<FacilityMeasureView> {
  List<Tag> childrenData = [];
  String name = "";

  void getChildrenData() async {
    var resultData = await facilityService.getChildrenData(name: name);
    List<Tag> tagObjs =
        resultData.map((tagJson) => Tag.fromJson(tagJson)).toList();
    setState(() {
      childrenData = tagObjs;
    });
  }

  @override
  void initState() {
    getChildrenData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10),
        child: Container(
            height: 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xFFF0EBCE),
                borderRadius: BorderRadius.circular(10)),
            child: FacilityMeasureTextField(setNameState: (String text) {
              setState(() {
                name = text;
              });

              getChildrenData();
            })),
      ),
      Expanded(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          children: childrenData.map(
            (r) {
              return FacilityCardListPatientMeasurement(
                  'Adik ${r.firstName} ${r.lastName}',
                  r.identifier,
                  r.updatedAt,
                  r._id);
            },
          ).toList(),
        ),
      )
    ]);
  }
}
