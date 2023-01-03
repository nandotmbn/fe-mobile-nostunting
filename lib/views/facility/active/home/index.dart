// ignore: unnecessary_import
// import 'package:no_stunting/components/bottom_nav_bar.dart';
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/home/partials/carousel.dart';
import 'package:no_stunting/views/facility/active/home/partials/current_day_child_monitoring.dart';
import 'package:no_stunting/views/facility/active/home/partials/current_day_mom_monitoring.dart';
import 'package:no_stunting/views/facility/active/home/partials/facility_info.dart';

class FacilityHomeView extends StatelessWidget {
  final int selectedIndex;
  final Function setSelectedIndex;
  const FacilityHomeView(this.selectedIndex, this.setSelectedIndex);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          const FacilityHomeCarousel(),
        ])),
        SliverList(
            delegate: SliverChildListDelegate([
          const FacilityHomeInfo(),
        ])),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Pemantauan ibu hari ini",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ))
        ])),
        const FacilityCurrentDayMomMonitoring(),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Pemantauan bayi hari ini",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ))
        ])),
        const FacilityCurrentDayChildMonitoring(),
      ],
    );
  }
}
