// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/facility_monitor.dart';

FacilityMonitorService monitorService = FacilityMonitorService();

class BoxMonitoringMom extends StatefulWidget {
  dynamic data;
  String type;
  BoxMonitoringMom({required this.data, required this.type});

  @override
  State<BoxMonitoringMom> createState() => _BoxMonitoringMomState();
}

class _BoxMonitoringMomState extends State<BoxMonitoringMom> {
  @override
  Widget build(BuildContext context) {
    String convertedTime = DateFormat('HH:mm')
        .format(DateTime.parse(widget.data["createdAt"])
            .add(const Duration(hours: 7)))
        .toString();
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
                          convertedTime,
                          style: TextStyle(
                              color: MyColor.level3,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Faskes",
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
                          '${widget.type} ${widget.data["patient"][0]["firstName"]} ${widget.data["patient"][0]["lastName"]}',
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
  dynamic monitor;
  FacilityCurrentDayMomMonitoring({required this.monitor});

  @override
  State<FacilityCurrentDayMomMonitoring> createState() =>
      _FacilityCurrentDayMomMonitoringState();
}

class _FacilityCurrentDayMomMonitoringState
    extends State<FacilityCurrentDayMomMonitoring> {
  String motherId = "";
  String childId = "";
  void getMasterRoles() async {
    var response = await monitorService.getMasterRolesData();

    for (var res in response) {
      if (res["name"] == "Mother") {
        setState(() {
          motherId = res["_id"];
        });
      }
      if (res["name"] == "Child") {
        setState(() {
          childId = res["_id"];
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getMasterRoles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 100),
      delegate: SliverChildListDelegate(
        widget.monitor.map<Widget>((mon) {
          if (mon["patient"][0]["rolesId"] == motherId) {
            return BoxMonitoringMom(
              type: "Ibu",
              data: mon,
            );
          } else if (mon["patient"][0]["rolesId"] == childId) {
            return BoxMonitoringMom(
              type: "Adik",
              data: mon,
            );
          }
          // if (mon) {}
        }).toList(),
      ),
    );
  }
}
