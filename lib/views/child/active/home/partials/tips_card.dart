import 'package:flutter/material.dart';

String tipsJson = '{"tips":['
    '{"name":"tips 1","image":"icon.png","id":2}, '
    '{"name":"tips 2","image":"icon.png","id":4}, '
    '{"name":"tips 3","image":"icon.png","id":4}, '
    '{"name":"tips 4","image":"icon.png","id":4}, '
    '{"name":"tips 5","image":"icon.png","id":6}]}';

class tips extends StatefulWidget {
  tips({Key? key}) : super(key: key);

  @override
  State<tips> createState() => _tipsState();
}

class _tipsState extends State<tips> {

  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: numbers.length, itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Card(
                  color: Colors.blue,
                  child: Container(
                    child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
                  ),
                ),
              );
        }),
    );
  }
}
