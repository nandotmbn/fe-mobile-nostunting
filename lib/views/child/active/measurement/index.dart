// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/views/child/active/measurement/partials/child_measurement_card.dart';

class ChildMeasurementView extends StatefulWidget {
  const ChildMeasurementView({super.key});
  @override
  State<ChildMeasurementView> createState() => _ChildMeasurementViewState();
}

class _ChildMeasurementViewState extends State<ChildMeasurementView> {
  dynamic monitorPatientData = [1];

  void refresher() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: MyColor.level2,
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Row(children: [
            Expanded(
              flex: 2,
              child: Image.asset('assets/img/baby-recording.png',
                  width: 200.0, height: 200.0),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pemantauan Pengisian Kalender',
                        style: TextStyle(
                            color: MyColor.level4,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Container(
                      margin: const EdgeInsets.only(top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adik Elton John',
                            style: TextStyle(
                                fontSize: 20,
                                color: MyColor.level4,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "12312538124",
                            style: TextStyle(
                                fontSize: 16,
                                color: MyColor.level4,
                                fontStyle: FontStyle.italic),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: Text(
                                'Total Pengukuran yang Dilakukan: ${monitorPatientData.length}',
                                style: TextStyle(
                                    fontSize: 16, color: MyColor.level4),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
        monitorPatientData.length < 1
            ? Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Image.asset('assets/img/not-found.png',
                        width: 100.0, height: 100.0),
                    Text(
                      "Pemantauan tidak ditemukan",
                      style: TextStyle(color: MyColor.level1, fontSize: 18),
                    )
                  ],
                ))
            : Expanded(
                child: Container(
                padding: const EdgeInsets.only(bottom: 50),
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(5),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  children: monitorPatientData.reversed.map<Widget>(
                    (r) {
                      return ChildMeasurementCard(
                          monitor: {}, type: "Monitor", refresher: refresher);
                    },
                  ).toList(),
                ),
              ))
      ],
    );
  }
}
