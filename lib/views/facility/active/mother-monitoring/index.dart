// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/mother-monitoring/partials/card_mother_monitoring.dart';
import 'package:no_stunting/views/facility/active/mother-monitoring/partials/header_mother_monitoring.dart';

class MotherMonitoringView extends StatelessWidget {
  final int selectedIndex;
  final Function setSelectedIndex;
  const MotherMonitoringView(this.selectedIndex, this.setSelectedIndex);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          child: Container(
              height: 120,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const HeaderMotherMonitoring())),
      Expanded(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          children: const [
            CardMotherMonitoring(),
            CardMotherMonitoring(),
            CardMotherMonitoring(),
            CardMotherMonitoring(),
            CardMotherMonitoring(),
            CardMotherMonitoring(),
            CardMotherMonitoring(),
          ],
        ),
      )
    ]);
  }
}
