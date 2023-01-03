import 'package:flutter/material.dart';

class HeaderMotherMonitoring extends StatelessWidget {
  const HeaderMotherMonitoring({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Container(
                margin: const EdgeInsets.only(right: 5),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            )),
        Expanded(
            flex: 2,
            child: InkWell(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xFF395144)),
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
