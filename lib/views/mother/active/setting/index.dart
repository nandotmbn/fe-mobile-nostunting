// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_stunting/views/facility/active/monitor/partials/menu.dart';
import 'package:no_stunting/views/facility/active/monitor/partials/monitoring_list_child.dart';
import 'package:no_stunting/views/facility/active/monitor/partials/monitoring_list_mom.dart';
import 'package:no_stunting/views/facility/active/monitor/partials/search_bar.dart';

class FacilityMonitorView extends StatefulWidget {
  const FacilityMonitorView({super.key});

  @override
  State<FacilityMonitorView> createState() => _FacilityMonitorViewState();
}

class _FacilityMonitorViewState extends State<FacilityMonitorView> {
  List<String> optionsRoles = <String>['Ibu', 'Anak'];
  String dropdownValueRoles = 'Ibu';

  List<String> optionsMom = <String>['Sudah', 'Belum'];
  String dropdownValueMom = 'Sudah';

  List<String> optionsChild = <String>['Faskes', 'Rumah'];
  String dropdownValueChild = 'Faskes';

  DateTime _dateTime = DateTime.now().toLocal();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(10),
        child: Container(
            height: 80,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xFFF0EBCE),
                borderRadius: BorderRadius.circular(10)),
            child: FacilityMonitorTextField()),
      ),
      Container(
          alignment: Alignment.centerLeft,
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
                    color: Color.fromARGB(255, 227, 227, 227),
                  ),
                  child: FacilityMonitorMenuView(
                    dropdownValue: dropdownValueRoles,
                    options: optionsRoles,
                    onChange: (String value) => {
                      setState(() => {dropdownValueRoles = value})
                    },
                  ),
                ),
                Container(
                  width: 120,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  margin: EdgeInsets.only(right: 4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 227, 227, 227),
                  ),
                  child: (dropdownValueRoles == "Ibu")
                      ? FacilityMonitorMenuView(
                          dropdownValue: dropdownValueMom,
                          options: optionsMom,
                          onChange: (String value) => {
                            setState(() => {dropdownValueMom = value})
                          },
                        )
                      : FacilityMonitorMenuView(
                          dropdownValue: dropdownValueChild,
                          options: optionsChild,
                          onChange: (String value) => {
                            setState(() => {dropdownValueChild = value})
                          },
                        ),
                ),
                InkWell(
                  onTap: () => {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2099),
                    ).then((date) {
                      //tambahkan setState dan panggil variabel _dateTime.
                      if (date == null) return;
                      setState(() {
                        _dateTime = date;
                      });
                      // ignore: invalid_return_type_for_catch_error
                    })
                  },
                  child: Container(
                      width: 130,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      margin: EdgeInsets.only(right: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 227, 227, 227),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(DateFormat.yMEd().format(_dateTime)),
                          Icon(
                            Icons.calendar_month,
                            color: Color.fromARGB(255, 51, 51, 51),
                            size: 10.0,
                          ),
                        ],
                      )),
                )
              ],
            ),
          )),
      Expanded(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(5),
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          childAspectRatio: 1.8,
          children: [
            BoxMonitoringChild(),
            BoxMonitoringMom(),
            BoxMonitoringChild(),
            BoxMonitoringMom(),
            BoxMonitoringMom(),
            BoxMonitoringMom(),
            BoxMonitoringChild(),
            BoxMonitoringChild(),
          ],
        ),
      )
    ]);
  }
}
