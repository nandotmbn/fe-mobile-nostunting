import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class MotherCard extends StatefulWidget {
  const MotherCard({Key? key}) : super(key: key);

  @override
  State<MotherCard> createState() => _MotherCardState();
}

class _MotherCardState extends State<MotherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: MyColor.level2,
        boxShadow: [
          BoxShadow(
            color: MyColor.level1.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Row(children: [
        Expanded(
            flex: 1,
            child: Image.asset('assets/img/welcome-nurse.png',
                width: 250.0, height: 250.0)),
        Expanded(
            flex: 2,
            child: Column(children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Selamat Datang Ibu!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: MyColor.level4,
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColor.level3,
                      boxShadow: [
                        BoxShadow(
                          color: MyColor.level3,
                          blurRadius: 5.0, // soften the shadow
                          offset: const Offset(
                            0.0,
                            5.0,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 0),
                            decoration: BoxDecoration(
                                color: MyColor.level3,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Nongsih Katakuri',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('1111-1111-1114',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        )),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(top: 14),
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Jalan Inkubasi Hahahihi',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                            )),
                                      ))
                                ]),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 0),
                            decoration: BoxDecoration(
                                color: MyColor.level3,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        'Anda terdaftar pada fasilitas kesehatan:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Puskesmas Nagatomo',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        )),
                                  ),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('1111-1111-1114',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        )),
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(top: 14),
                                      child: const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Jalan Inkubasi Hahahihi',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                            )),
                                      ))
                                ]),
                          ),
                        ]), //Container
                  ),
                ],
              )
            ]))
      ]),
    );
  }
}


/*
SizedBox(
          width: double.infinity,
          // height: 250,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Text(
                  "Selamat Datang Ibu,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: MyColor.level1,
                      fontSize: 20),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyColor.level3,
                  boxShadow: [
                    BoxShadow(
                      color: MyColor.level3,
                      blurRadius: 5.0, // soften the shadow
                      offset: const Offset(
                        0.0,
                        5.0,
                      ),
                    )
                  ],
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 0),
                        decoration: BoxDecoration(
                            color: MyColor.level3,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Nongsih Katakuri',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('1111-1111-1114',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 14),
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Jalan Inkubasi Hahahihi',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        )),
                                  ))
                            ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 0),
                        decoration: BoxDecoration(
                            color: MyColor.level3,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    'Anda terdaftar pada fasilitas kesehatan:',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold)),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Puskesmas Nagatomo',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('1111-1111-1114',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontStyle: FontStyle.italic,
                                    )),
                              ),
                              Container(
                                  margin: const EdgeInsets.only(top: 14),
                                  child: const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Jalan Inkubasi Hahahihi',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        )),
                                  ))
                            ]),
                      ),
                    ]), //Container
              ),
            ],
          )),
    )
*/