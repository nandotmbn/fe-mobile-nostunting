import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/child_home.dart';
import 'package:no_stunting/views/child/active/home/partials/child_card.dart';
import 'package:no_stunting/views/child/active/home/partials/child_calendar_home.dart';
import 'package:no_stunting/views/child/active/home/partials/child_record_home.dart';

ChildHomeService childService = ChildHomeService();

class ChildHomeView extends StatefulWidget {
  const ChildHomeView({super.key});

  @override
  State<ChildHomeView> createState() => _ChildHomeViewState();
}

class _ChildHomeViewState extends State<ChildHomeView> {
  dynamic child = {};
  dynamic facility = {};
  dynamic monitor = [];
  dynamic measure = [];
  bool isLoading = true;
  void getChildHome() async {
    setState(() {
      isLoading = true;
    });
    var resultData = await childService.getData();
    if (resultData["monitor"] == null && resultData["measure"] == null) {
      setState(() {
        facility = resultData["facility"];
      });
    } else if (resultData["monitor"] == null) {
      setState(() {
        facility = resultData["facility"];
      });
    } else if (resultData["measure"] == null) {
      setState(() {
        facility = resultData["facility"];
      });
    } else {
      setState(() {
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
      child = resultData["child"];
      monitor = cards;
      measure = cards_;
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getChildHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            ChildCard(
              facility: facility,
              child: child,
            ),
          ]),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "Pengisian Kalender Hari Ini",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColor.level1,
                    fontSize: 24),
              ))
        ])),
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
                            "Pengisian hari ini belum dilakukan",
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
        ChildCalendarHome(history: monitor),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "Pengukuran Hari Ini",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColor.level1,
                    fontSize: 24),
              ))
        ])),
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
                            "Pengukuran hari ini belum dilakukan",
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
        ChildRecordendarHome(
          history: measure,
        )
      ],
    );
  }
}
