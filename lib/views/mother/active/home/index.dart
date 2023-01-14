import 'package:flutter/material.dart';
import 'package:no_stunting/views/mother/active/home/partials/history_card.dart';
import 'package:no_stunting/views/mother/active/home/partials/mother_card.dart';

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
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                    child: Text("Tips 1"),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                    child: Text("Tips 2"),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                    child: Text("Tips 3"),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                    child: Text("Tips 4"),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                    child: Text("Tips 4"),
                  ),
                ],
              ),
            ))
          ]),
        ),
      ],
    );
  }
}
