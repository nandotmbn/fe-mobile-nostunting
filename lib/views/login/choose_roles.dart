// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/screens/facility/login.dart';
import 'package:no_stunting/screens/mother/login.dart';

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

class RolesBox extends StatelessWidget {
  final String iconPath, title, desc;
  final Color bgColor, titleColor, descColor;
  final Function onClick;
  const RolesBox(this.iconPath, this.title, this.desc, this.bgColor,
      this.titleColor, this.descColor, this.onClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 15, top: 15, right: 10, left: 10),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(iconPath, width: 100.0, height: 100.0),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                color: titleColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              desc,
                              style: TextStyle(color: descColor),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          )),
      onTap: () => onClick(),
    );
  }
}
