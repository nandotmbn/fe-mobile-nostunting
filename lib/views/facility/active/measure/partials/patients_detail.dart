// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:no_stunting/constant/color.dart';
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
  String convertedDate = "";
  double age = 0.0;

  void getPatientData() async {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      dynamic data = await facilityService.getPatientData(id: widget._id);
      String _convertedDate = DateFormat('yMMMMd').format(
          DateFormat("yyyy-MM-dd")
              .parse(DateTime.parse(data["bornAt"]).toString()));
      setState(() {
        userData = data;
        userData = data;
        convertedDate = _convertedDate;
        isLoading = false;
        age = DateTime.parse(data["bornAt"]).difference(DateTime.now()).inDays /
            -30;
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
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: MyColor.level1,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
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
                                'Nama: Adik ${userData["firstName"]} ${userData["lastName"]}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        alignment: Alignment.centerLeft,
                        child: isLoading
                            ? SkeletonCustom(
                                width: 900,
                                height: 15,
                              )
                            : Text(
                                'NIK: ${userData["identifier"]}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        alignment: Alignment.centerLeft,
                        child: isLoading
                            ? SkeletonCustom(
                                width: 900,
                                height: 15,
                              )
                            : Text(
                                'Tanggal Lahir: $convertedDate',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        alignment: Alignment.centerLeft,
                        child: isLoading
                            ? SkeletonCustom(
                                width: 900,
                                height: 15,
                              )
                            : Text(
                                'Usia: ${age.toString()} bulan / ${(age / 12).toStringAsFixed(1)} tahun',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        alignment: Alignment.centerLeft,
                        child: isLoading
                            ? SkeletonCustom(
                                width: 900,
                                height: 15,
                              )
                            : Text(
                                'Alamat: ${userData["address"]}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      )
                    ],
                  ),
                )),
          ],
        )));
  }
}
