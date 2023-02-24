import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/views/child/active/home/partials/child_card.dart';
import 'package:no_stunting/views/mother/active/home/partials/history_card.dart';
import 'package:no_stunting/views/mother/active/home/partials/mother_card.dart';

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
        // SliverList(
        //     delegate: SliverChildListDelegate([
        //   Container(
        //       margin: const EdgeInsets.all(10),
        //       child: Text(
        //         "Riwayat",
        //         style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             color: MyColor.level1,
        //             fontSize: 24),
        //       ))
        // ])),
        // History(),
        // SliverList(
        //     delegate: SliverChildListDelegate([
        //   Container(
        //       margin: const EdgeInsets.all(10),
        //       child: Text(
        //         "Tips",
        //         style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             color: MyColor.level1,
        //             fontSize: 24),
        //       ))
        // ])),
        // SliverList(
        //   delegate: SliverChildListDelegate([
        //     SingleChildScrollView(
        //       scrollDirection: Axis.horizontal,
        //       child: Row(
        //         children: [
        //           Container(
        //             margin: const EdgeInsets.all(8),
        //             height: 200,
        //             width: 200,
        //             color: Colors.blue,
        //             child: const Text("Tips 1"),
        //           ),
        //           Container(
        //             margin: const EdgeInsets.all(8),
        //             height: 200,
        //             width: 200,
        //             color: Colors.blue,
        //             child: const Text("Tips 2"),
        //           ),
        //           Container(
        //             margin: const EdgeInsets.all(8),
        //             height: 200,
        //             width: 200,
        //             color: Colors.blue,
        //             child: const Text("Tips 3"),
        //           ),
        //           Container(
        //             margin: const EdgeInsets.all(8),
        //             height: 200,
        //             width: 200,
        //             color: Colors.blue,
        //             child: const Text("Tips 4"),
        //           ),
        //           Container(
        //             margin: const EdgeInsets.all(8),
        //             height: 200,
        //             width: 200,
        //             color: Colors.blue,
        //             child: const Text("Tips 4"),
        //           ),
        //         ],
        //       ),
        //     )
        //   ]),
        // ),
      ],
    );
  }
}
