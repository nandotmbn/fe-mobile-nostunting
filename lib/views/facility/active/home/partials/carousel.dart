// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/widgets/skeleton.dart';

class FacilityHomeCarousel extends StatefulWidget {
  dynamic facility = {
    "firstname": "Puskesmas",
    "lastName": "",
  };

  FacilityHomeCarousel({required this.facility});

  @override
  State<FacilityHomeCarousel> createState() => _FacilityHomeCarouselState();
}

class _FacilityHomeCarouselState extends State<FacilityHomeCarousel> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                  "Selamat Datang!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: MyColor.level4,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 12),
                child: widget.facility["firstName"] == null
                    ? SkeletonCustom(height: 12, width: 120)
                    : Text(
                        '${widget.facility["firstName"]} ${widget.facility["lastName"]}',
                        textAlign: TextAlign.left,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
              )
            ]))
      ]),
    );
  }
}
