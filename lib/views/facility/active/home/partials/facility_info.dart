// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/widgets/skeleton.dart';

class FacilityHomeInfo extends StatefulWidget {
  int totalService = 0;
  dynamic facility = {
    "firstname": "Puskesmas",
    "lastName": "",
    "address": "",
    "identifier": "",
  };

  FacilityHomeInfo({required this.totalService, required this.facility});

  @override
  State<FacilityHomeInfo> createState() => _FacilityHomeInfoState();
}

class _FacilityHomeInfoState extends State<FacilityHomeInfo> {
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
                  decoration: BoxDecoration(
                      color: MyColor.level3,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Hari Ini",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            widget.totalService.toString(),
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 64,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Pelayanan",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 16,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 0),
                  decoration: BoxDecoration(
                      color: MyColor.level3,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: widget.facility["firstName"] == null
                              ? SkeletonCustom(height: 12, width: 120)
                              : Text(
                                  '${widget.facility["firstName"]} ${widget.facility["lastName"]}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold)),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: widget.facility["identifier"] == null
                              ? SkeletonCustom(height: 12, width: 120)
                              : Text('${widget.facility["identifier"]}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                  )),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 14),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: widget.facility["address"] == null
                                  ? SkeletonCustom(height: 12, width: 120)
                                  : Text('${widget.facility["address"]}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                      )),
                            ))
                      ]),
                )),
          ],
        )));
  }
}
