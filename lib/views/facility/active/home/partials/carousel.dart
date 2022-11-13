import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
      child: CarouselSlider(
        options: CarouselOptions(
            height: 180.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 4.0),
        items: imgList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Center(
                  child: Image.asset(i, fit: BoxFit.cover, width: 1000));
            },
          );
        }).toList(),
      ),
    );
  }
}
