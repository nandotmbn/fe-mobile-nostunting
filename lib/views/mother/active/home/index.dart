import 'package:flutter/material.dart';
import 'package:no_stunting/views/mother/active/home/partials/history_card.dart';
import 'package:no_stunting/views/mother/active/home/partials/mother_card.dart';
import 'package:no_stunting/views/mother/active/home/partials/tips_card.dart';


class HomeMotherView extends StatelessWidget {
  const HomeMotherView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            MotherCard(),
          ]),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Riwayat",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ))
        ])),
        History(),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                "Tips",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ))
        ])),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 270,
            child: ListView.builder(
              
                itemExtent: 150,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.all(5.0),
                      color: Colors.orangeAccent,
                    ),
                itemCount: 20),
          ),
        ),
      ],
    );
  }
}
