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

  bool isChecked = true;

  void toggleChecked() async {}

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hapus Pemantauan Pengukuran Bayi?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Anda tidak dapat mengembalikan penghapusan.'),
                Text('Apakah anda benar-benar ingin menghapus pengukuran ini?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(child: const Text('Ya'), onPressed: () async {}),
            TextButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
        .parse(DateTime.now().add(const Duration(hours: 7)).toString()));
    String convertedTime = DateFormat('HH:mm')
        .format(DateTime.now().add(const Duration(hours: 7)))
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
                                        "55 cm",
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
                                      "7 Kg",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: MyColor.level4,
                                          wordSpacing: 2),
                                    ),
                                  ],
                                )
                              ],
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
                      _showMyDialog();
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "Hapus",
                        style: TextStyle(color: MyColor.level4, fontSize: 12),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      // showModalBottomSheet(
                      //     context: context,
                      //     builder: (context) {
                      //       return FacilityMonitorCommentBottom(
                      //         monitor: widget.monitor,
                      //         changeCheck: (state) {
                      //           setState(() {
                      //             isChecked = state;
                      //           });
                      //         },
                      //       );
                      //     });
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          color: MyColor.level2,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "Komentari",
                        style: TextStyle(color: MyColor.level4, fontSize: 12),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      toggleChecked();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          border: Border.all(color: MyColor.level1),
                          color: !isChecked ? MyColor.level1 : MyColor.level4,
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        isChecked ? "Batal Cek" : "Cek",
                        style: TextStyle(
                            fontSize: 12,
                            color: isChecked ? MyColor.level1 : MyColor.level4),
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
