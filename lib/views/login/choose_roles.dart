// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/screens/child/login.dart';
import 'package:no_stunting/screens/facility/login.dart';
import 'package:no_stunting/screens/mother/login.dart';
import 'package:no_stunting/widgets/roles_box.dart';

class ChooseRolesView extends StatelessWidget {
  const ChooseRolesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Masuk Sebagai",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: MyColor.level1),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      RolesBox(
                          'assets/img/hospital_white.png',
                          'Fasilitas Kesehatan',
                          'Memberikan pelayanan dengan fitur unggulan seperti petunjuk, pengukuran dan pemantauan.',
                          MyColor.level1,
                          MyColor.level2,
                          MyColor.level4, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginFacility()),
                        );
                      }),
                      RolesBox(
                          'assets/img/pregnancy_white.png',
                          'Ibu Hamil',
                          'Mendapatkan informasi terkait gizi ibu hamil yang terpantau dari fasilitas kesehatan..',
                          MyColor.level2,
                          MyColor.level4,
                          MyColor.level4, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginMother()),
                        );
                      }),
                      RolesBox(
                          'assets/img/baby_brown.png',
                          'Bayi/Balita',
                          'Mendapatkan fasilitas pemantauan gizi bayi / balita, rekapitulasi dan petunjuk pencegahan stunting dari fasilitas kesehatan.',
                          MyColor.level4,
                          MyColor.level3,
                          MyColor.level2, () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginChild()),
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
