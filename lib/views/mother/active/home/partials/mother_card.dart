import 'package:flutter/material.dart';

class MotherCard extends StatefulWidget {
  MotherCard({Key? key}) : super(key: key);

  @override
  State<MotherCard> createState() => _MotherCardState();
}

class _MotherCardState extends State<MotherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
          width: double.infinity,
          height: 250,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: const Text(
                  "Selamat Datang,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 242, 232, 232),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 53, 50, 50),
                      blurRadius: 15.0, // soften the shadow
                      spreadRadius: 5.0, //extend the shadow
                      offset: Offset(
                        5.0, // Move to right 5  horizontally
                        5.0, // Move to bottom 5 Vertically
                      ),
                    )
                  ],
                ),

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      HomeBox(
                        'assets/img/profile.png',
                        'Ningsih',
                        '26 Tahun',
                        'Keputih Gg 3 B, Surabaya, Jawa Timur',
                        Color.fromARGB(255, 242, 232, 232),
                        const Color(0xFF395144),
                        const Color(0xFF395144),
                        Color.fromARGB(255, 0, 0, 0),
                      )
                    ]), //Container
              ),
            ],
          )),
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
                      backgroundImage: AssetImage("assets/img/profile.png"),
                      child: Stack(children: [
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