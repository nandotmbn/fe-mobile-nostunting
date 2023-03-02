// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/mother_calendar.dart';
import 'package:no_stunting/views/mother/active/calendar/partials/mother_monitoring_card.dart';
import 'package:no_stunting/widgets/skeleton.dart';

MotherCalendarService motherService = MotherCalendarService();

class MotherCalendarView extends StatefulWidget {
  const MotherCalendarView({super.key});
  @override
  State<MotherCalendarView> createState() => _MotherCalendarViewState();
}

class _MotherCalendarViewState extends State<MotherCalendarView> {
  dynamic mother = {};
  dynamic monitor = [];
  bool isPostLoading = false;
  bool isLoading = true;
  final TextEditingController _controller = TextEditingController();

  void postComment() async {
    setState(() {
      isPostLoading = true;
    });
    var result = await motherService.postMonitoring(
        comment: _controller.text.toString());
    setState(() {
      isPostLoading = false;
    });

    getMotherHome();
    Navigator.pop(context);
  }

  void getMotherHome() async {
    setState(() {
      isLoading = true;
    });
    var resultData = await motherService.getData();
    if (resultData["monitor"] == null) {
      setState(() {
        monitor = [];
      });
    } else {
      setState(() {
        monitor = resultData["monitor"];
      });
    }

    setState(() {
      mother = resultData["mother"];
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getMotherHome();
    super.initState();
  }

  void refresher() async {
    setState(() {});
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Tulis pemantauan hari ini'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColor.level4,
                    ),
                    child: TextField(
                      controller: _controller,
                      maxLines: 8, //or null
                      autofocus: true,
                      style: TextStyle(color: MyColor.level1),
                      decoration: InputDecoration.collapsed(
                          hintText: "Tulis disini",
                          hintStyle: TextStyle(color: MyColor.level1)),
                    ))
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: Text(isPostLoading == true ? 'Mengirim' : 'Kirim'),
                onPressed: () async {
                  if (isPostLoading == true) return;
                  postComment();
                }),
          ],
        );
      },
    );
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
              child: Image.asset('assets/img/calendar-monitor.png',
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
                          mother["firstName"] != null
                              ? Text(
                                  'Ibu ${mother["firstName"]} ${mother["lastName"]}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: MyColor.level4,
                                      fontWeight: FontWeight.bold),
                                )
                              : SkeletonCustom(height: 18, width: 160),
                          mother["identifier"] != null
                              ? Text(
                                  "${mother["identifier"]}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: MyColor.level4,
                                      fontStyle: FontStyle.italic),
                                )
                              : SkeletonCustom(height: 18, width: 160),
                          Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: Text(
                                'Total Pengisian Kalender: ${monitor.length}',
                                style: TextStyle(
                                    fontSize: 16, color: MyColor.level4),
                              )),
                          Container(
                            margin: const EdgeInsets.only(top: 32),
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: _showMyDialog,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: MyColor.level4,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0))),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: Text(
                                  "Tulis pemantauan hari ini +",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: MyColor.level1),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
        isLoading == false
            ? monitor.length < 1
                ? Container(
                    alignment: Alignment.center,
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
                    child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(5),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    children: monitor.reversed.map<Widget>(
                      (r) {
                        return MotherCalendarCard(
                          type: "Monitor",
                          refresher: refresher,
                          monitor: r,
                        );
                      },
                    ).toList(),
                  ))
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
      ],
    );
  }
}
