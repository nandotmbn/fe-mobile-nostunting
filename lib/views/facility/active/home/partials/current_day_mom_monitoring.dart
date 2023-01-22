// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class BoxMonitoringMom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
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
                          "55.55",
                          style: TextStyle(
                              color: MyColor.level3,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Belum di cek",
                          style: TextStyle(
                              color: MyColor.level3,
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
                      children: [
                        Text(
                          "Ibu John Notonegoro",
                          style: TextStyle(
                              color: MyColor.level3,
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
                  decoration: BoxDecoration(
                      color: MyColor.level2,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
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

class FacilityCurrentDayMomMonitoring extends StatefulWidget {
  const FacilityCurrentDayMomMonitoring({super.key});

  @override
  State<FacilityCurrentDayMomMonitoring> createState() =>
      _FacilityCurrentDayMomMonitoringState();
}

class _FacilityCurrentDayMomMonitoringState
    extends State<FacilityCurrentDayMomMonitoring> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 100),
      delegate: SliverChildListDelegate(
        [
          BoxMonitoringMom(),
          BoxMonitoringMom(),
          BoxMonitoringMom(),
          BoxMonitoringMom(),
        ],
      ),
    );
  }
}
