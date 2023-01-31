// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/screens/facility/active/measure/record.dart';
import 'package:no_stunting/screens/facility/active/patient/update_patient.dart';
import 'package:no_stunting/widgets/card_list_patient_data.dart';

class FacilityCardListPatientMonitoring extends StatelessWidget {
  dynamic patient;
  bool isMother;
  FacilityCardListPatientMonitoring(
      {required this.patient, this.isMother = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: MyColor.level1.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ]),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              CardListPatientData("Nama Pasien",
                  '${isMother ? "Ibu" : "Adik"} ${patient["firstName"]} ${patient["lastName"]}'),
              CardListPatientData("NIK", patient["identifier"]),
              CardListPatientData("Alamat", patient["address"]),
            ]),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FacilityUpdatePatient(patient["_id"])),
                  )
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColor.level2,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    "Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
