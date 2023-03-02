// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/widgets/skeleton.dart';

class MotherCard extends StatefulWidget {
  dynamic mother = {};
  dynamic facility = {};
  MotherCard({required this.mother, required this.facility});

  @override
  State<MotherCard> createState() => _MotherCardState();
}

class _MotherCardState extends State<MotherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: MyColor.level2,
        boxShadow: [
          BoxShadow(
            color: MyColor.level1.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Row(children: [
        Expanded(
            flex: 1,
            child: Image.asset('assets/img/welcome-nurse.png',
                width: 250.0, height: 250.0)),
        Expanded(
            flex: 2,
            child: Column(children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Selamat Datang Ibu!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: MyColor.level4,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColor.level3,
                      boxShadow: [
                        BoxShadow(
                          color: MyColor.level3,
                          blurRadius: 5.0, // soften the shadow
                          offset: const Offset(
                            0.0,
                            5.0,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 0),
                            decoration: BoxDecoration(
                                color: MyColor.level3,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: widget.mother["firstName"] != null
                                        ? Text(
                                            '${widget.mother["firstName"]} ${widget.mother["lastName"]}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold))
                                        : SkeletonCustom(
                                            height: 18, width: 170),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: widget.mother["identifier"] != null
                                        ? Text('${widget.mother["identifier"]}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                            ))
                                        : SkeletonCustom(
                                            height: 18, width: 170),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(top: 14),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: widget.mother["address"] != null
                                            ? Text(
                                                '${widget.mother["address"]}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.italic,
                                                ))
                                            : SkeletonCustom(
                                                height: 18, width: 170),
                                      ))
                                ]),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 0),
                            decoration: BoxDecoration(
                                color: MyColor.level3,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Anda terdaftar pada fasilitas kesehatan:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: widget.facility["firstName"] != null
                                        ? Text(
                                            '${widget.facility["firstName"]} ${widget.facility["lastName"]}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                            ))
                                        : SkeletonCustom(
                                            height: 18, width: 170),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: widget.facility["identifier"] != null
                                        ? Text(
                                            '${widget.facility["identifier"]}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                            ))
                                        : SkeletonCustom(
                                            height: 18, width: 170),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(top: 14),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: widget.facility["address"] !=
                                                null
                                            ? Text(
                                                '${widget.facility["address"]}',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontStyle: FontStyle.italic,
                                                ))
                                            : SkeletonCustom(
                                                height: 18, width: 170),
                                      ))
                                ]),
                          ),
                        ]), //Container
                  ),
                ],
              )
            ]))
      ]),
    );
  }
}
