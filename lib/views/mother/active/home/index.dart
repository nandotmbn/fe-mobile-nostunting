// ignore: unnecessary_import
import 'package:no_stunting/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeMotherView extends StatelessWidget {
  const HomeMotherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: SizedBox(
            width: double.infinity,
            height: 150,
            child: Column(
              children: <Widget>[
                Text(
                  "Selamat Datang,",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:
                            Color.fromRGBO(252, 251, 244, 1)), //BoxDecoration
                  ), //Container
                ), //Flexible
              ],
            )));
  }
}
