// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/screens/facility/active/monitor/child_detail.dart';
import 'package:no_stunting/screens/facility/active/monitor/child_record_detail.dart';
import 'package:no_stunting/views/facility/active/monitor/index.dart';

class BoxMonitoringChild extends StatelessWidget {
  MonitorPatientData childData;
  String type;

  BoxMonitoringChild(this.childData, this.type);

  @override
  Widget build(BuildContext context) {
    String convertedDate = DateFormat('yMMMMd').format(DateFormat("yyyy-MM-dd")
        .parse(DateTime.parse(childData.createdAt)
            .add(const Duration(hours: 7))
            .toString()));
    String convertedTime = DateFormat('HH:mm')
        .format(
            DateTime.parse(childData.createdAt).add(const Duration(hours: 7)))
        .toString();
    return Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          convertedDate,
                          style: TextStyle(
                            color: MyColor.level1,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          convertedTime,
                          style: TextStyle(
                              color: MyColor.level1,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          childData.isChecked ? "Sudah di cek" : "Belum di cek",
                          style: TextStyle(
                              color: childData.isChecked
                                  ? MyColor.level2
                                  : Colors.red,
                              fontStyle: FontStyle.italic,
                              fontSize: 12),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Adik ${childData.firstName} ${childData.lastName}',
                          style: TextStyle(
                              color: MyColor.level1,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return type == "Monitor"
                          ? FacilityMonitorDetail(childData.patientId)
                          : FacilityChildRecordDetail(childData.patientId);
                    }),
                  )
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColor.level3,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    "Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
