import 'package:flutter/material.dart';

class FacilityMeasureTextField extends StatefulWidget {
  const FacilityMeasureTextField({super.key});

  @override
  State<FacilityMeasureTextField> createState() =>
      _FacilityMeasureTextFieldState();
}

class _FacilityMeasureTextFieldState extends State<FacilityMeasureTextField> {
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
                style: const TextStyle(
                    fontSize: 18, color: Color.fromARGB(255, 86, 86, 86)),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Cari nama bayi/balita",
                    fillColor: Color(0xFFD9D9D9)),
              ),
            )),
        Expanded(
            flex: 1,
            child: InkWell(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 6, 0, 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFF395144)),
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
