// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_element, unrelated_type_equality_checks, unused_local_variable, non_constant_identifier_names, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/facility_monitor.dart';
import 'package:no_stunting/views/facility/active/monitor/partials/menu.dart';
import 'package:no_stunting/views/facility/active/monitor/partials/monitoring_list_child.dart';
import 'package:no_stunting/views/facility/active/monitor/partials/monitoring_list_mom.dart';
import 'package:no_stunting/views/facility/active/monitor/partials/search_bar.dart';

FacilityMonitorService facilityService = FacilityMonitorService();

class MonitorPatientData {
  String firstName, lastName, id, patientId, typeId, createdAt;
  bool isChecked;

  MonitorPatientData(this.firstName, this.lastName, this.id, this.patientId,
      this.typeId, this.createdAt, this.isChecked);

  factory MonitorPatientData.fromJson(dynamic json) {
    return MonitorPatientData(
      json['patient'][0]['firstName'] as String,
      json['patient'][0]['lastName'] as String,
      json['_id'] as String,
      json['patient'][0]['_id'] as String,
      json['patientTypeId'] as String,
      json['createdAt'] as String,
      json['isChecked'] as bool,
    );
  }

  @override
  String toString() {
    return '{ $firstName, $lastName, $typeId, $id, $patientId, $createdAt, $isChecked}';
  }
}

class FacilityMonitorView extends StatefulWidget {
  const FacilityMonitorView({super.key});

  @override
  State<FacilityMonitorView> createState() => _FacilityMonitorViewState();
}

class _FacilityMonitorViewState extends State<FacilityMonitorView> {
  List<String> optionsRoles = <String>['Semua', 'Ibu', 'Anak'];
  String dropdownValueRoles = 'Semua';

  List<String> monitoringType = <String>['Kalender', 'Pengukuran'];
  String dropdownValueType = 'Kalender';

  List<String> options = <String>['Semua', 'Sudah', 'Belum'];
  String dropdownValue = 'Semua';

  bool isFilterOpen = true;
  bool isLoading = true;

  String motherId = "";
  String childId = "";

  String name = "";

  DateTime _dateTime = DateTime.utc(1970, 1, 1);

  List<MonitorPatientData> monitorPatientData = [];

  void getMasterData() async {
    var resultData = await facilityService.getMasterRolesData();
    for (var type in resultData) {
      if (type["name"] == "Child") {
        setState(() {
          childId = type["_id"];
        });
      } else if (type["name"] == "Mother") {
        setState(() {
          motherId = type["_id"];
        });
      }
    }
  }

  void getInitData() async {
    setState(() {
      isLoading = true;
    });
    var date__ = DateFormat("yyyy-MM-dd").format(_dateTime);
    var newDate =
        DateTime.parse(date__).add(const Duration(hours: -7)).toIso8601String();
    var resultData = await facilityService.getInitData(
      mode: dropdownValueType == "Kalender" ? "calendar" : "record",
      datetime: '${newDate}Z',
      isChecked: dropdownValue == "Semua"
          ? ""
          : dropdownValue == "Sudah"
              ? "true"
              : "false",
      name: name,
      type: dropdownValueType == "Kalender"
          ? dropdownValueRoles == "Semua"
              ? ""
              : dropdownValueRoles == "Ibu"
                  ? motherId
                  : childId
          : "",
    );
    if (resultData == null) {
      return setState(() {
        monitorPatientData = [];
      });
    }
    List<MonitorPatientData> tagObjs = resultData
        .map<MonitorPatientData>(
            (tagJson) => MonitorPatientData.fromJson(tagJson))
        .toList();

    List<String> ids = [];

    List<MonitorPatientData> cards = [];

    for (var ob in tagObjs.reversed) {
      bool flag = false;
      for (var id in ids) {
        if (id == ob.patientId) {
          flag = true;
        }
      }
      if (flag == false) {
        ids.add(ob.patientId);
        cards.add(ob);
      }
    }

    setState(() {
      isLoading = false;
      monitorPatientData = cards;
    });
  }

  void changeName(String _name) {
    setState(() {
      name = _name;
    });

    getInitData();
  }

  void filterStateChange() {
    setState(() {
      isFilterOpen = !isFilterOpen;
    });
  }

  @override
  void initState() {
    getMasterData();
    getInitData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          child: Container(
              height: 80,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: MyColor.level3),
              child: FacilityMonitorTextField(
                filter: isFilterOpen,
                onFilterChange: filterStateChange,
                onChange: changeName,
              ))),
      isFilterOpen
          ? Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              color: MyColor.level3,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColor.level3,
                      ),
                      child: FacilityMonitorMenuView(
                        title: "Jenis pemantauan",
                        dropdownValue: dropdownValueType,
                        options: monitoringType,
                        onChange: (String value) {
                          setState(() => {dropdownValueType = value});
                          if (value == "Pengukuran") {
                            setState(() {
                              dropdownValueRoles = "Anak";
                              optionsRoles = ["Anak"];
                            });
                          } else {
                            setState(() {
                              dropdownValueRoles = "Semua";
                              optionsRoles = ["Semua", "Ibu", "Anak"];
                            });
                          }
                          getInitData();
                        },
                      ),
                    ),
                  ],
                ),
              ))
          : SizedBox.shrink(),
      isFilterOpen
          ? Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              color: MyColor.level3,
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColor.level3,
                      ),
                      child: FacilityMonitorMenuView(
                        title: "Ibu/Anak",
                        dropdownValue: dropdownValueRoles,
                        options: optionsRoles,
                        onChange: (String value) {
                          setState(() {
                            dropdownValueRoles = value;
                          });
                          getInitData();
                        },
                      ),
                    ),
                    Container(
                        width: 120,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyColor.level3,
                        ),
                        child: FacilityMonitorMenuView(
                          title: "Status pengecekan",
                          dropdownValue: dropdownValue,
                          options: options,
                          onChange: (String value) {
                            setState(() => {dropdownValue = value});
                            getInitData();
                          },
                        )),
                    Container(
                        width: 140,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyColor.level3,
                        ),
                        child: Column(children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Terakhir update",
                              style: TextStyle(
                                  color: MyColor.level4, fontSize: 10),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () => {
                                        showDatePicker(
                                          context: context,
                                          initialDate: _dateTime ==
                                                  DateTime.utc(1970, 1, 1)
                                              ? DateTime.now()
                                              : _dateTime,
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2099),
                                        ).then((date) {
                                          if (date == null) return;
                                          setState(() {
                                            _dateTime = date;
                                          });

                                          getInitData();
                                        })
                                      },
                                  child: Container(
                                    height: 32,
                                    alignment: Alignment.bottomLeft,
                                    child: Text(
                                      _dateTime == DateTime.utc(1970, 1, 1)
                                          ? "Pilih tanggal"
                                          : DateFormat.yMEd().format(_dateTime),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      _dateTime = DateTime.utc(1970, 1, 1);
                                    });

                                    getInitData();
                                  },
                                  child: Container(
                                    height: 32,
                                    alignment: Alignment.bottomLeft,
                                    child: Icon(
                                      Icons.remove_circle_outline_outlined,
                                      color: Color.fromARGB(255, 143, 0, 179),
                                      size: 26.0,
                                    ),
                                  )),
                            ],
                          )
                        ])),
                  ],
                ),
              ))
          : SizedBox.shrink(),
      isLoading == false
          ? monitorPatientData.length < 1
              ? Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 50),
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
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      childAspectRatio: 1.8,
                      children: dropdownValueType == "Kalender"
                          ? monitorPatientData.map(
                              (r) {
                                if (r.typeId == childId) {
                                  return BoxMonitoringChild(r, "Monitor");
                                } else {
                                  return BoxMonitoringMom(r);
                                }
                              },
                            ).toList()
                          : monitorPatientData.map(
                              (r) {
                                return BoxMonitoringChild(r, "Record");
                              },
                            ).toList()),
                )
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
    ]);
  }
}
