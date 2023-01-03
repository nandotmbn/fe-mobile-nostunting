import 'package:flutter/material.dart';

class FacilityCardListPatientMeasurement extends StatelessWidget {
  const FacilityCardListPatientMeasurement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color(0xFFF0EBCE),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "Nama Pasien",
                        style: TextStyle(
                            color: Color(0xFFAA8B56),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "Adik Windah Basunawa",
                        style: TextStyle(
                            color: Color(0xFF395144),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "NIK",
                        style: TextStyle(
                            color: Color(0xFFAA8B56),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "3506XXXXXXXXXXXX",
                        style: TextStyle(
                            color: Color(0xFF395144),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "Terakhir Update",
                        style: TextStyle(
                            color: Color(0xFFAA8B56),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        "16 November 2022, 13.00 WIB",
                        style: TextStyle(
                            color: Color(0xFF395144),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ]),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => {},
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF395144),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    "Ukur",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
