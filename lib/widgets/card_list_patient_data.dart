// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

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
              style: const TextStyle(
                  color: Color(0xFFAA8B56),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: const EdgeInsets.only(bottom: 5),
            child: Text(
              content,
              style: const TextStyle(
                  color: Color(0xFF395144),
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
