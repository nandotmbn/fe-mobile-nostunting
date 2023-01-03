// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class BoxMonitoringChild extends StatelessWidget {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "55.55",
                          style: TextStyle(
                              color: Color(0xFFAA8B56),
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Faskes",
                          style: TextStyle(
                              color: Color(0xFF395144),
                              fontStyle: FontStyle.italic,
                              fontSize: 12),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Adik Adik",
                          style: TextStyle(
                              color: Color(0xFF395144),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
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
                    "Detail",
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

class FacilityCurrentDayChildMonitoring extends StatefulWidget {
  const FacilityCurrentDayChildMonitoring({super.key});

  @override
  State<FacilityCurrentDayChildMonitoring> createState() =>
      _FacilityCurrentDayChildMonitoringState();
}

class _FacilityCurrentDayChildMonitoringState
    extends State<FacilityCurrentDayChildMonitoring> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 100),
      delegate: SliverChildListDelegate(
        [
          BoxMonitoringChild(),
          BoxMonitoringChild(),
          BoxMonitoringChild(),
          BoxMonitoringChild(),
        ],
      ),
    );
  }
}
