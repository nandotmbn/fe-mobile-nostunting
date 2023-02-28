// ignore: unnecessary_import
// import 'package:no_stunting/components/bottom_nav_bar.dart';
// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/facility_home.dart';
import 'package:no_stunting/views/facility/active/home/partials/carousel.dart';
import 'package:no_stunting/views/facility/active/home/partials/current_day_child_monitoring.dart';
import 'package:no_stunting/views/facility/active/home/partials/current_day_mom_monitoring.dart';
import 'package:no_stunting/views/facility/active/home/partials/facility_info.dart';

FacilityHomeService facilityService = FacilityHomeService();

class FacilityHomeView extends StatefulWidget {
  final int selectedIndex;
  final Function setSelectedIndex;
  const FacilityHomeView(this.selectedIndex, this.setSelectedIndex);

  @override
  State<FacilityHomeView> createState() => _FacilityHomeViewState();
}

class _FacilityHomeViewState extends State<FacilityHomeView> {
  dynamic facility = {};
  dynamic monitor = [];
  dynamic measure = [];
  int totalService = 0;
  bool isLoading = true;
  void getFacilityHome() async {
    var resultData = await facilityService.getData();
    if (resultData["monitor"] == null && resultData["measure"] == null) {
      setState(() {
        totalService = 0;
        facility = resultData["facility"];
      });
    } else if (resultData["monitor"] == null) {
      setState(() {
        totalService = resultData["measure"].length;
        facility = resultData["facility"];
      });
    } else if (resultData["measure"] == null) {
      setState(() {
        totalService = resultData["monitor"].length;
        facility = resultData["facility"];
      });
    } else {
      setState(() {
        totalService =
            resultData["monitor"].length + resultData["measure"].length;
        facility = resultData["facility"];
      });
    }

    List<String> ids = [];

    List<dynamic> cards = [];
    List<String> ids_ = [];

    List<dynamic> cards_ = [];

    if (resultData["monitor"] == null) {
      setState(() {
        monitor = [];
      });
    } else {
      for (var ob in resultData["monitor"].reversed) {
        bool flag = false;
        for (var id in ids) {
          if (id == ob["patientId"]) {
            flag = true;
          }
        }
        if (flag == false) {
          ids.add(ob["patientId"]);
          cards.add(ob);
        }
      }
    }
    if (resultData["measure"] == null) {
      setState(() {
        measure = [];
      });
    } else {
      for (var ob in resultData["measure"].reversed) {
        bool flag = false;
        for (var id in ids_) {
          if (id == ob["patientId"]) {
            flag = true;
          }
        }
        if (flag == false) {
          ids_.add(ob["patientId"]);
          cards_.add(ob);
        }
      }
    }

    setState(() {
      monitor = cards;
      measure = cards_;
      isLoading = false;
    });
  }

  @override
  void initState() {
    getFacilityHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          FacilityHomeCarousel(facility: facility),
        ])),
        SliverList(
            delegate: SliverChildListDelegate([
          FacilityHomeInfo(
            facility: facility,
            totalService: totalService,
          ),
        ])),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Pemantauan hari ini",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF06283D),
                    fontSize: 24),
              ))
        ])),
        FacilityCurrentDayMomMonitoring(
          monitor: monitor,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          isLoading == false
              ? monitor.length == 0
                  ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/img/not-found.png',
                              width: 40.0, height: 40.0),
                          Text(
                            "Pemantauan belum ada",
                            style:
                                TextStyle(color: MyColor.level1, fontSize: 18),
                          )
                        ],
                      ))
                  : const SizedBox.shrink()
              : Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      const SpinKitRing(color: Colors.blue),
                      Text(
                        "Memuat",
                        style: TextStyle(color: MyColor.level1, fontSize: 18),
                      )
                    ],
                  ))
        ])),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Pengukuran bayi hari ini",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF06283D),
                    fontSize: 24),
              ))
        ])),
        FacilityCurrentDayChildMonitoring(
          monitor: measure,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          isLoading == false
              ? measure.length == 0
                  ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Image.asset('assets/img/not-found.png',
                              width: 40.0, height: 40.0),
                          Text(
                            "Pengukuran belum ada",
                            style:
                                TextStyle(color: MyColor.level1, fontSize: 18),
                          )
                        ],
                      ))
                  : const SizedBox.shrink()
              : Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      const SpinKitRing(color: Colors.blue),
                      Text(
                        "Memuat",
                        style: TextStyle(color: MyColor.level1, fontSize: 18),
                      )
                    ],
                  ))
        ])),
      ],
    );
  }
}
