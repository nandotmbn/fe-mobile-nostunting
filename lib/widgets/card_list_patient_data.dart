// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class CardListPatientData extends StatelessWidget {
  final String title, content;
  const CardListPatientData(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              title,
              style: TextStyle(
                color: MyColor.level2,
                fontSize: 12,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              content,
              style: TextStyle(
                color: MyColor.level2,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        )
      ],
    );
  }
}
