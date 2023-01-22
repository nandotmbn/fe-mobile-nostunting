// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class RecordFormHead extends StatelessWidget {
  final String title, content;
  RecordFormHead({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: MyColor.level3, fontSize: 16),
          ),
          Text(
            content,
            style: TextStyle(
                color: MyColor.level4,
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
