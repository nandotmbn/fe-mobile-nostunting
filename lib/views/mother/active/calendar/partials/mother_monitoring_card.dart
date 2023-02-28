// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_stunting/constant/color.dart';

class MotherCalendarCard extends StatefulWidget {
  dynamic monitor;
  String type; // Record || Monitor
  Function refresher;

  MotherCalendarCard(
      {required this.monitor, required this.type, required this.refresher});
  @override
  State<MotherCalendarCard> createState() => _MotherCalendarCardState();
}

class _MotherCalendarCardState extends State<MotherCalendarCard> {
  String selectedId = "";

  bool isChecked = true;

  void toggleChecked() async {}

  @override
  void initState() {
    // setState(() {
    //   isChecked = widget.monitor.isChecked;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String convertedDate = DateFormat('yMMMMd').format(DateFormat("yyyy-MM-dd")
        .parse(DateTime.parse(widget.monitor["createdAt"])
            .add(const Duration(hours: 7))
            .toString()));
    String convertedTime = DateFormat('HH:mm')
        .format(DateTime.parse(widget.monitor["createdAt"])
            .add(const Duration(hours: 7)))
        .toString();

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                convertedDate,
                style: TextStyle(
                    color: MyColor.level3,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 2,
              child: Text(
                convertedTime,
                style: TextStyle(
                    color: MyColor.level1,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 1,
              child: Text(
                widget.monitor["isChecked"] ? "Sudah di cek" : "Belum di cek",
                style: TextStyle(
                    color: widget.monitor["isChecked"]
                        ? MyColor.level2
                        : Colors.red),
              )),
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                child: Text(
                  "Kegiatan anda",
                  style: TextStyle(color: MyColor.level1),
                ),
              )),
          Expanded(
            flex: 4,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                    color: MyColor.level1,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                widget.monitor["content"],
                                style: TextStyle(
                                    color: MyColor.level4, wordSpacing: 2),
                              ),
                            )
                          ],
                        )))),
          ),
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                child: Text(
                  "Komentar faskes",
                  style: TextStyle(color: MyColor.level1),
                ),
              )),
          Expanded(
            flex: 4,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                    color: MyColor.level1,
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                widget.monitor["comment"].length != 0
                                    ? widget.monitor!["comment"][0]["content"]
                                    : "-",
                                style: TextStyle(
                                    color: MyColor.level4, wordSpacing: 2),
                              ),
                            )
                          ],
                        )))),
          ),
        ],
      ),
    );
  }
}
