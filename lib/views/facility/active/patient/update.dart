// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/views/facility/active/patient/partials/register_form.dart';
import 'package:no_stunting/views/facility/active/patient/partials/update_form.dart';

class FacilityPatientUpdateView extends StatefulWidget {
  String userId;
  FacilityPatientUpdateView({required this.userId});

  @override
  State<FacilityPatientUpdateView> createState() =>
      _FacilityPatientUpdateViewState();
}

class _FacilityPatientUpdateViewState extends State<FacilityPatientUpdateView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    child: Image.asset('assets/img/register-patient.png',
                        width: 200.0, height: 200.0)),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ubah data pasien",
                      style: TextStyle(
                          color: MyColor.level1,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Pastikan data pasien terekam dengan baik.",
                      style: TextStyle(
                        color: MyColor.level1,
                        fontSize: 16,
                      ),
                    )
                  ],
                ))
              ],
            )),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: MyColor.level3,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: SingleChildScrollView(
                child: FacilityPatientUpdateForm(
              userId: widget.userId,
            )),
          ),
        )
      ],
    );
  }
}
