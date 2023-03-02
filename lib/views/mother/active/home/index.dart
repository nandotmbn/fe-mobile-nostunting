import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/mother_home.dart';
import 'package:no_stunting/views/mother/active/home/partials/history_card.dart';
import 'package:no_stunting/views/mother/active/home/partials/mother_card.dart';

MotherHomeService motherService = MotherHomeService();

class MotherHomeView extends StatefulWidget {
  const MotherHomeView({super.key});

  @override
  State<MotherHomeView> createState() => _MotherHomeViewState();
}

class _MotherHomeViewState extends State<MotherHomeView> {
  dynamic mother = {};
  dynamic facility = {};
  dynamic monitor = [];
  dynamic measure = [];
  bool isLoading = true;
  void getMotherHome() async {
    setState(() {
      isLoading = true;
    });
    var resultData = await motherService.getData();
    if (resultData["monitor"] == null) {
      setState(() {
        facility = resultData["facility"];
        mother = resultData["mother"];
        monitor = [];
        isLoading = false;
      });
    } else {
      setState(() {
        mother = resultData["mother"];
        facility = resultData["facility"];
        monitor = resultData["monitor"];
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getMotherHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            MotherCard(mother: mother, facility: facility),
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
        History(history: monitor),
      ],
    );
  }
}
