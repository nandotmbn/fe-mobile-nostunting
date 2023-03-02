// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_stunting/constant/color.dart';

class HistoryBox extends StatelessWidget {
  dynamic monitor;
  BuildContext context;
  HistoryBox({required this.monitor, required this.context});

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detail'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text("Isian Anda"),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColor.level4,
                    ),
                    child: Text(monitor["content"])),
                const Text("Komentar Faskes"),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColor.level4,
                    ),
                    child: Text(monitor["comment"] == null
                        ? "-"
                        : monitor["comment"][0]["content"])),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Oke'),
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
  Widget build(BuildContext context) {
    String convertedTime = DateFormat('HH:mm')
        .format(
            DateTime.parse(monitor["createdAt"]).add(const Duration(hours: 7)))
        .toString();
    return Container(
        decoration: BoxDecoration(
            color: MyColor.level1,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
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
                          convertedTime,
                          style: TextStyle(
                              color: MyColor.level4,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          monitor["isChecked"]
                              ? "Sudah di cek"
                              : "Belum di cek",
                          style: TextStyle(
                              color: monitor["isChecked"]
                                  ? MyColor.level3
                                  : Colors.redAccent,
                              fontStyle: FontStyle.italic,
                              fontSize: 12),
                        ),
                      ],
                    )),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => {_showMyDialog()},
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColor.level4,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: Text(
                    "Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: MyColor.level1),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class History extends StatefulWidget {
  dynamic history = [];
  History({required this.history});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 100),
      delegate: SliverChildListDelegate(
        widget.history.map<Widget>((mon) {
          return HistoryBox(
            context: context,
            monitor: mon,
          );
        }).toList(),
      ),
    );
  }
}
