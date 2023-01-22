import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

final List<String> imgList = [
  'assets/img/carousel1.jpg',
  'assets/img/carousel2.jpg',
  'assets/img/carousel3.jpg',
  'assets/img/carousel4.jpg',
  'assets/img/carousel5.jpg',
];

class FacilityHomeCarousel extends StatefulWidget {
  const FacilityHomeCarousel({super.key});

  @override
  State<FacilityHomeCarousel> createState() => _FacilityHomeCarouselState();
}

class _FacilityHomeCarouselState extends State<FacilityHomeCarousel> {
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
            offset: Offset(0, 8), // changes position of shadow
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
                child: const Text(
                  "Puskesmas Mongolia Kuno Selatan Administrator",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              )
            ]))
      ]),
    );
  }
}
