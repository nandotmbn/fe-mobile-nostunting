// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, unused_local_variable, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/facility_monitor.dart';
import 'package:no_stunting/views/facility/active/monitor/partials/calendar_monitoring_card_list.dart';
import 'package:no_stunting/widgets/skeleton.dart';

FacilityMonitorService facilityService = FacilityMonitorService();

// class MonitorPatientDataById {
//   String id, patientId, createdAt, content;
//   bool isChecked;

//   MonitorPatientDataById(
//       this.id, this.patientId, this.createdAt, this.isChecked, this.content);

//   factory MonitorPatientDataById.fromJson(dynamic json) {
//     return MonitorPatientDataById(
//       json['_id'] as String,
//       json['patientId'] as String,
//       json['createdAt'] as String,
//       json['isChecked'] as bool,
//       json['content'] as String,
//     );
//   }

//   @override
//   String toString() {
//     return '{ $id, $patientId, $createdAt, $isChecked, $content}';
//   }
// }

// class RecordPatientDataById {
//   String id, patientId, createdAt;
//   bool isChecked;
//   num height, weight;

//   RecordPatientDataById(this.id, this.patientId, this.createdAt, this.isChecked,
//       this.height, this.weight);

//   factory RecordPatientDataById.fromJson(dynamic json) {
//     return RecordPatientDataById(
//       json['_id'] as String,
//       json['patientId'] as String,
//       json['createdAt'] as String,
//       json['isChecked'] as bool,
//       json['height'] as num,
//       json['weight'] as num,
//     );
//   }

//   @override
//   String toString() {
//     return '{ $id, $patientId, $createdAt, $isChecked, $height, $weight}';
//   }
// }

class FacilityMonitorCalendar extends StatefulWidget {
  String id, role, type;
  FacilityMonitorCalendar(
      {required this.id, required this.role, required this.type});

  @override
  State<FacilityMonitorCalendar> createState() =>
      _FacilityMonitorCalendarState();
}

class _FacilityMonitorCalendarState extends State<FacilityMonitorCalendar> {
  dynamic user = {"firstName": "", "lastName": "", "identifier": ""};
  int monitorCount = 0;
  bool isLoading = true;
  List<dynamic> monitorPatientData = [];
  void getAllData() async {
    setState(() {
      isLoading = true;
    });
    var resultData = await facilityService.getAllDataById(
      id: widget.id,
    );
    int _count = 0;
    for (var element in resultData[widget.type]) {
      _count += 1;
    }

    List<dynamic> tagObjs = resultData[widget.type].toList();

    List<dynamic> tagObjs2 = resultData[widget.type].toList();

    setState(() {
      user = resultData["User"];
      monitorCount = _count;
      monitorPatientData = widget.type == "Monitor" ? tagObjs : tagObjs2;
      isLoading = false;
    });
  }

  void refresher() {
    getAllData();
  }

  @override
  void initState() {
    getAllData();
    super.initState();
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
              child: Image.asset(
                  widget.type == "Monitor"
                      ? 'assets/img/calendar-monitor.png'
                      : 'assets/img/baby-recording.png',
                  width: 200.0,
                  height: 200.0),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Pemantauan ${widget.type == "Monitor" ? "Pengisian Kalender" : "Pengukuran Bayi"}',
                        style: TextStyle(
                            color: MyColor.level4,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    Container(
                      margin: const EdgeInsets.only(top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          user["firstName"] != ""
                              ? Text(
                                  '${widget.role} ${user["firstName"]} ${user["lastName"]}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: MyColor.level4,
                                      fontWeight: FontWeight.bold),
                                )
                              : SkeletonCustom(height: 15, width: 120),
                          user["firstName"] != ""
                              ? Text(
                                  user["identifier"],
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: MyColor.level4,
                                      fontStyle: FontStyle.italic),
                                )
                              : SkeletonCustom(height: 15, width: 120),
                          Container(
                              margin: const EdgeInsets.only(top: 12),
                              child: Text(
                                'Total ${widget.type == "Monitor" ? "Pengisian Kalender" : "Pengukuran Bayi"}: $monitorCount',
                                style: TextStyle(
                                    fontSize: 16, color: MyColor.level4),
                              ))
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
            ? monitorPatientData.length < 1
                ? Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 50),
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
                    children: monitorPatientData.reversed.map(
                      (r) {
                        return CardMonitoringChild(
                          type: widget.type,
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
