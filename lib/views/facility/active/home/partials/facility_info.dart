import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class FacilityHomeInfo extends StatefulWidget {
  const FacilityHomeInfo({super.key});

  @override
  State<FacilityHomeInfo> createState() => _FacilityHomeInfoState();
}

class _FacilityHomeInfoState extends State<FacilityHomeInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        child: IntrinsicHeight(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: MyColor.level3,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Hari Ini",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "37",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 64,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Pelayanan",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 0),
                  decoration: BoxDecoration(
                      color: MyColor.level3,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Puskesmas Mongolia Kuno Selatan",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("DINKES/SBY/231273",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              )),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 14),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Jl Keputih Tegal, no 14, Keputih, Kec Sukolilo, Surabaya.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  )),
                            ))
                      ]),
                )),
          ],
        )));
  }
}
