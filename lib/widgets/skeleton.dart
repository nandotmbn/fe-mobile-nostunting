// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonCustom extends StatelessWidget {
  final double width, height;
  SkeletonCustom({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Shimmer.fromColors(
      baseColor: const Color.fromARGB(110, 184, 184, 184),
      highlightColor: const Color.fromARGB(181, 255, 255, 255),
      period: const Duration(milliseconds: 700),
      child: Container(
        height: height,
        width: width,
        color: const Color.fromARGB(255, 8, 48, 77),
      ),
    ));
  }
}
