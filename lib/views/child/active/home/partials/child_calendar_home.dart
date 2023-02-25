import 'package:flutter/material.dart';

class HistoryBox extends StatelessWidget {
  const HistoryBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color(0xFFF0EBCE),
            borderRadius: BorderRadius.all(Radius.circular(10))),
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
                      children: const [
                        Text(
                          "11 November 2022",
                          style: TextStyle(
                              color: Color.fromARGB(255, 28, 104, 89),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Belum di cek",
                          style: TextStyle(
                              color: Color(0xFF395144),
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
                  decoration: const BoxDecoration(
                      color: Color(0xFF395144),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: const Text(
                    "Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class ChildCalendarHome extends StatefulWidget {
  const ChildCalendarHome({super.key});

  @override
  State<ChildCalendarHome> createState() => _ChildCalendarHomeState();
}

class _ChildCalendarHomeState extends State<ChildCalendarHome> {
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
