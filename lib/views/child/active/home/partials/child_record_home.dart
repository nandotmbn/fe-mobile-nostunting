import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class HistoryBox extends StatelessWidget {
  const HistoryBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: MyColor.level1,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "25 Februari 2023",
                          style: TextStyle(
                              color: MyColor.level4,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Belum di cek",
                          style: TextStyle(
                              color: MyColor.level3,
                              fontStyle: FontStyle.italic,
                              fontSize: 12),
                        ),
                      ],
                    )),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => {},
                child: Container(
                  decoration: BoxDecoration(
                      color: MyColor.level4,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: Text(
                    "Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: MyColor.level1),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class ChildRecordendarHome extends StatefulWidget {
  const ChildRecordendarHome({super.key});

  @override
  State<ChildRecordendarHome> createState() => _ChildRecordHomeState();
}

class _ChildRecordHomeState extends State<ChildRecordendarHome> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 100),
      delegate: SliverChildListDelegate(
        [
          HistoryBox(),
          HistoryBox(),
          HistoryBox(),
          HistoryBox(),
          HistoryBox(),
          HistoryBox()
        ],
      ),
    );
  }
}
