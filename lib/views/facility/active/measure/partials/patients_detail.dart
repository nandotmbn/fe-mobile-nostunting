// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/services/facility_measure.dart';
import 'package:no_stunting/widgets/skeleton.dart';

FacilityMeasureService facilityService = FacilityMeasureService();

class FacilityMeasurePatientDetail extends StatefulWidget {
  final String _id;
  FacilityMeasurePatientDetail(this._id);

  @override
  State<FacilityMeasurePatientDetail> createState() =>
      _FacilityMeasurePatientDetailState();
}

class _FacilityMeasurePatientDetailState
    extends State<FacilityMeasurePatientDetail> {
  dynamic userData = "";
  bool isLoading = true;

  void getPatientData() async {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      dynamic data = await facilityService.getPatientData(id: widget._id);
      setState(() {
        userData = data;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getPatientData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 10, left: 10),
        child: IntrinsicHeight(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                        color: Color(0xFFAA8B56),
                        borderRadius: BorderRadius.all(Radius.circular(10))))),
            Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Color(0xFF395144),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: isLoading
                            ? SkeletonCustom(
                                width: 900,
                                height: 15,
                              )
                            : Text(
                                'Adik ${userData["firstName"]} ${userData["lastName"]}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: isLoading
                            ? SkeletonCustom(
                                width: 900,
                                height: 15,
                              )
                            : Text(
                                '${userData["identifier"]}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: isLoading
                            ? SkeletonCustom(
                                width: 900,
                                height: 15,
                              )
                            : Text(
                                '${userData["address"]}',
                                style: const TextStyle(
                                    color: Color(0xFFAA8B56),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                      )
                    ],
                  ),
                )),
          ],
        )));
  }
}
