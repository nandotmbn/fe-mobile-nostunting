// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/facility_monitor.dart';
import 'package:no_stunting/views/facility/active/monitor/calendar.dart';
import 'package:no_stunting/views/facility/active/monitor/partials/bottom_comment.dart';

FacilityMonitorService facilityService = FacilityMonitorService();

class CardMonitoringChild extends StatefulWidget {
  MonitorPatientDataById monitor;

  CardMonitoringChild({required this.monitor});

  @override
  State<CardMonitoringChild> createState() => _CardMonitoringChildState();
}

class _CardMonitoringChildState extends State<CardMonitoringChild> {
  String selectedId = "";

  bool isChecked = true;

  @override
  void initState() {
    setState(() {
      isChecked = widget.monitor.isChecked;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String convertedDate = DateFormat('yMMMMd').format(DateFormat("yyyy-MM-dd")
        .parse(DateTime.parse(widget.monitor.createdAt)
            .add(const Duration(hours: 7))
            .toString()));
    String convertedTime = DateFormat('HH:mm')
        .format(DateTime.parse(widget.monitor.createdAt)
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
                isChecked ? "Sudah di cek" : "Belum di cek",
                style:
                    TextStyle(color: isChecked ? MyColor.level2 : Colors.red),
              )),
          Expanded(
            flex: 10,
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
                            child: Text(
                              widget.monitor.content,
                              style: TextStyle(
                                  color: MyColor.level4, wordSpacing: 2),
                            ),
                          )
                        ],
                      )),
                )),
          ),
          Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (() {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return FacilityMonitorCommentBottom(
                              monitor: widget.monitor,
                              changeCheck: (state) {
                                setState(() {
                                  isChecked = state;
                                });
                              },
                            );
                          });
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          color: MyColor.level2,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "Komentari",
                        style: TextStyle(color: MyColor.level4),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          color: MyColor.level1,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "Cek",
                        style: TextStyle(color: MyColor.level4),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
