// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:no_stunting/views/facility/active/measure/partials/card_list_patient.dart';
import 'package:no_stunting/views/facility/active/patient/partials/menu.dart';
import 'package:no_stunting/views/facility/active/patient/partials/search_bar.dart';
import 'package:intl/intl.dart';

class FacilityPatientView extends StatefulWidget {
  const FacilityPatientView({super.key});

  @override
  State<FacilityPatientView> createState() => _FacilityPatientViewState();
}

class _FacilityPatientViewState extends State<FacilityPatientView> {
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
          child: FacilityPatientTextField()),
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
                  child: FacilityPatientMenuView(
                    dropdownValue: dropdownValueRoles,
                    options: optionsRoles,
                    onChange: (String value) => {
                      setState(() => {dropdownValueRoles = value})
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
          childAspectRatio: 1.4,
          children: const [
            FacilityCardListPatientMeasurement(),
            FacilityCardListPatientMeasurement(),
            FacilityCardListPatientMeasurement(),
            FacilityCardListPatientMeasurement(),
            FacilityCardListPatientMeasurement(),
            FacilityCardListPatientMeasurement(),
            FacilityCardListPatientMeasurement(),
          ],
        ),
      )
    ]);
  }
}
