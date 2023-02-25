import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/views/mother/active/home/partials/history_card.dart';
import 'package:no_stunting/views/mother/active/home/partials/mother_card.dart';

class MotherHomeView extends StatelessWidget {
  const MotherHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            const MotherCard(),
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
        const History(),
      ],
    );
  }
}
