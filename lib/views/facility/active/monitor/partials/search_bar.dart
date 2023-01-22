import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class FacilityMonitorTextField extends StatefulWidget {
  const FacilityMonitorTextField({super.key});

  @override
  State<FacilityMonitorTextField> createState() =>
      _FacilityMonitorTextFieldState();
}

class _FacilityMonitorTextFieldState extends State<FacilityMonitorTextField> {
  @override
  Widget build(BuildContext context) {
    return const TextFieldMonitor();
  }
}

class TextFieldMonitor extends StatelessWidget {
  const TextFieldMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
              child: TextField(
                onChanged: (text) {},
                style: TextStyle(fontSize: 18, color: MyColor.level1),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Cari nama bayi/balita",
                    fillColor: MyColor.level4),
              ),
            )),
        Expanded(
            flex: 1,
            child: InkWell(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: MyColor.level1),
                alignment: Alignment.center,
                child: const Text(
                  "Cari",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )),
      ],
    );
  }
}
