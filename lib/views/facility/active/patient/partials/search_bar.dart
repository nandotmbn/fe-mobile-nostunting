// ignore_for_file: use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/screens/facility/active/patient/register_patient.dart';

class FacilityPatientTextField extends StatefulWidget {
  Function onChange;
  FacilityPatientTextField({
    required this.onChange,
  });

  @override
  State<FacilityPatientTextField> createState() =>
      _FacilityPatientTextFieldState();
}

class _FacilityPatientTextFieldState extends State<FacilityPatientTextField> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Row(
      children: [
        Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: TextField(
                onChanged: (text) {
                  widget.onChange(text);
                },
                style: TextStyle(fontSize: 18, color: MyColor.level1),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Cari nama bayi/balita",
                    fillColor: MyColor.level4),
              ),
            )),
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FacilityRegisterPatient()),
                );
              },
              child: Container(
                  margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyColor.level4),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.app_registration,
                    color: MyColor.level3,
                  )),
            )),
      ],
    ));
  }
}
