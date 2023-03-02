// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_stunting/constant/color.dart';

class ChildMeasurementCard extends StatefulWidget {
  dynamic monitor;
  String type; // Record || Monitor
  Function refresher;

  ChildMeasurementCard(
      {required this.monitor, required this.type, required this.refresher});
  @override
  State<ChildMeasurementCard> createState() => _ChildMeasurementCardState();
}

class _ChildMeasurementCardState extends State<ChildMeasurementCard> {
  String selectedId = "";

  @override
  void initState() {
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
            flex: 15,
            child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tinggi badan",
                                        style: TextStyle(
                                            color: MyColor.level4,
                                            wordSpacing: 2),
                                      ),
                                      Text(
                                        '${widget.monitor["height"]} cm',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: MyColor.level4,
                                            wordSpacing: 2),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Berat badan",
                                      style: TextStyle(
                                          color: MyColor.level4,
                                          wordSpacing: 2),
                                    ),
                                    Text(
                                      "${widget.monitor["weight"]} Kg",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: MyColor.level4,
                                          wordSpacing: 2),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Komentar Faskes",
                                        style: TextStyle(
                                            color: MyColor.level4,
                                            wordSpacing: 2),
                                      ),
                                      Text(
                                        widget.monitor["comment"].length != 0
                                            ? widget.monitor!["comment"][0]
                                                ["content"]
                                            : "-",
                                        style: TextStyle(
                                            color: MyColor.level4,
                                            fontSize: 18,
                                            wordSpacing: 2),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                )),
          ),
        ],
      ),
    );
  }
}
