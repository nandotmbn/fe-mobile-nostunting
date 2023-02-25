import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/views/child/active/home/partials/child_card.dart';
import 'package:no_stunting/views/child/active/home/partials/child_calendar_home.dart';
import 'package:no_stunting/views/child/active/home/partials/child_record_home.dart';

class ChildHomeView extends StatelessWidget {
  const ChildHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            const ChildCard(),
          ]),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "Pengisian Kalender Hari Ini",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColor.level1,
                    fontSize: 24),
              ))
        ])),
        const ChildCalendarHome(),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                "Pengukuran Hari Ini",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColor.level1,
                    fontSize: 24),
              ))
        ])),
        const ChildRecordendarHome()
      ],
    );
  }
}
