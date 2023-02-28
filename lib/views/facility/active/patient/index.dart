// ignore_for_file: prefer_const_constructors, avoid_print, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/facility_monitor.dart';
import 'package:no_stunting/services/facility_patients.dart';
import 'package:no_stunting/views/facility/active/patient/partials/card_list_patient.dart';
import 'package:no_stunting/views/facility/active/patient/partials/menu.dart';
import 'package:no_stunting/views/facility/active/patient/partials/search_bar.dart';

FacilityMonitorService facilityMonitorService = FacilityMonitorService();
FacilityPatientsService facilityPatientService = FacilityPatientsService();

class FacilityPatientView extends StatefulWidget {
  const FacilityPatientView({super.key});

  @override
  State<FacilityPatientView> createState() => _FacilityPatientViewState();
}

class _FacilityPatientViewState extends State<FacilityPatientView> {
  List<String> optionsRoles = <String>['Semua', 'Ibu', 'Anak'];
  String dropdownValueRoles = 'Semua';

  List<String> optionsMom = <String>['Sudah', 'Belum'];
  String dropdownValueMom = 'Sudah';

  List<String> optionsChild = <String>['Faskes', 'Rumah'];
  String dropdownValueChild = 'Faskes';

  String name = "";

  String motherId = "";
  String childId = "";

  bool isLoading = true;

  List<dynamic> patientsData = [];

  void getMasterData() async {
    var resultData = await facilityMonitorService.getMasterRolesData();
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
    var resultData = await facilityPatientService.getInitData(
        name: name,
        role: dropdownValueRoles == "Semua"
            ? ""
            : dropdownValueRoles == "Ibu"
                ? motherId
                : childId);
    if (resultData == null) {
      return setState(() {
        patientsData = [];
      });
    } else {
      setState(() {
        patientsData = resultData;
      });
    }

    setState(() {
      isLoading = false;
    });
  }

  bool isFilterOpen = true;
  void filterStateChange() {
    setState(() {
      isFilterOpen = !isFilterOpen;
    });
  }

  void changeName(String _name) {
    setState(() {
      name = _name;
    });
    getInitData();
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
              child: FacilityPatientTextField(
                onChange: changeName,
              ))),
      Container(
          alignment: Alignment.centerLeft,
          color: MyColor.level3,
          padding: const EdgeInsets.all(10),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Container(
                  width: 120,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.only(right: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MyColor.level3,
                  ),
                  child: FacilityPatientMenuView(
                    title: "Jenis Pasien",
                    dropdownValue: dropdownValueRoles,
                    options: optionsRoles,
                    onChange: (String value) {
                      setState(() => {dropdownValueRoles = value});
                      getInitData();
                    },
                  ),
                )
              ],
            ),
          )),
      isLoading == false
          ? patientsData.length < 1
              ? Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: [
                      Image.asset('assets/img/not-found.png',
                          width: 100.0, height: 100.0),
                      Text(
                        "Pasien tidak ditemukan",
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
                      childAspectRatio: 1.4,
                      children: patientsData.map(
                        (r) {
                          // return FacilityCardListPatientMonitoring();
                          if (r["rolesId"] == childId) {
                            return FacilityCardListPatientMonitoring(
                              patient: r,
                              isMother: false,
                            );
                          } else {
                            return FacilityCardListPatientMonitoring(
                                patient: r);
                          }
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
