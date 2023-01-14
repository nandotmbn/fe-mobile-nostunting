// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
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
                const Text(
                  "Masuk Sebagai",
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 232, 255, 225)),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      RolesBox(
                          'assets/img/hospital_white.png',
                          'Fasilitas Kesehatan',
                          'Memberikan pelayanan dengan fitur unggulan seperti petunjuk, pengukuran dan pemantauan.',
                          const Color(0xFF395144),
                          const Color(0xFFFFFFFF),
                          const Color(0xFF9F9B9B), () {
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
                          const Color(0xFFAA8B56),
                          const Color(0xFFFFFFFF),
                          const Color(0xFF395144), () {
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
                          const Color(0xFFF0EBCE),
                          const Color(0xFFAA8B56),
                          const Color(0xFF395144), () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const LoginFacility()),
                        // );
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
