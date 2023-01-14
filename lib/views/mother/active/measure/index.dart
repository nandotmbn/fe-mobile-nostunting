// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/views/mother/active/measure/partials/card_list_patient.dart';
import 'package:no_stunting/views/mother/active/measure/partials/search_bar.dart';

class FacilityMeasureView extends StatefulWidget {
  const FacilityMeasureView({super.key});

  @override
  State<FacilityMeasureView> createState() => _FacilityMeasureViewState();
}

class _FacilityMeasureViewState extends State<FacilityMeasureView> {
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
            child: FacilityMeasureTextField()),
      ),
      Expanded(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          children: const [
            // FacilityCardListPatientMeasurement(),
            // FacilityCardListPatientMeasurement(),
            // FacilityCardListPatientMeasurement(),
            // FacilityCardListPatientMeasurement(),
            // FacilityCardListPatientMeasurement(),
            // FacilityCardListPatientMeasurement(),
            // FacilityCardListPatientMeasurement(),
          ],
        ),
      )
    ]);
  }
}
