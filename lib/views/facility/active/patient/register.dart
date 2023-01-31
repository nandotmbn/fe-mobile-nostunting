import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/views/facility/active/patient/partials/register_form.dart';

class FacilityRegisterPatientView extends StatelessWidget {
  const FacilityRegisterPatientView({super.key});

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
                      "Pendaftaran pasien",
                      style: TextStyle(
                          color: MyColor.level1,
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Daftarkan pasienmu dan berikan pelayanan yang terbaik.",
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
            child: const SingleChildScrollView(
                child: FacilityPatientRegisterForm()),
          ),
        )
      ],
    );
  }
}
