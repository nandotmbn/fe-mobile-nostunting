import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class ChildCard extends StatefulWidget {
  const ChildCard({Key? key}) : super(key: key);

  @override
  State<ChildCard> createState() => _ChildCardState();
}

class _ChildCardState extends State<ChildCard> {
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
                  "Selamat Datang Adik!",
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

class HomeBox extends StatelessWidget {
  final String iconPath, name, age, address;
  final Color bgColor, nameColor, ageColor, addresColor;
  const HomeBox(this.iconPath, this.name, this.age, this.address, this.bgColor,
      this.nameColor, this.ageColor, this.addresColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding:
                const EdgeInsets.only(bottom: 15, top: 15, right: 10, left: 10),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      radius: 58,
                      backgroundImage:
                          const AssetImage("assets/img/profile.png"),
                      child: Stack(children: const [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white70,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ]),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                                color: nameColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              age,
                              style: TextStyle(color: ageColor),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              address,
                              style: TextStyle(color: addresColor),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}
