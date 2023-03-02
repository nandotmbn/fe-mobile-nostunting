import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/screens/mother/login.dart';
import 'package:no_stunting/services/mother_home.dart';

MotherHomeService facilityService = MotherHomeService();

const storage = FlutterSecureStorage();

class MotherSettingView extends StatefulWidget {
  const MotherSettingView({super.key});

  @override
  State<MotherSettingView> createState() => _MotherngViewState();
}

class _MotherngViewState extends State<MotherSettingView> {
  bool isLoading = false;
  String serialNumber = "";
  String password = "";
  String jwt = "";
  dynamic facility = {};

  void getJwtToken() async {
    var jwtToken = await storage.read(key: "jwtMother");
    setState(() {
      jwt = jwtToken!;
    });
  }

  void getFacilityHome() async {
    setState(() {
      isLoading = true;
    });
    var resultData = await facilityService.getData();
    setState(() {
      facility = resultData["mother"];
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getJwtToken();
    getFacilityHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    const SpinKitRing(color: Colors.blue),
                    Text(
                      "Memuat",
                      style: TextStyle(color: MyColor.level1, fontSize: 18),
                    )
                  ],
                ))
          ]);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Anda masuk sebagai Ibu:',
          style: TextStyle(fontSize: 20, color: MyColor.level2),
          textAlign: TextAlign.center,
        ),
        Text(
          '${facility?["firstName"]} ${facility?["lastName"]}',
          style: TextStyle(
              fontSize: 40, color: MyColor.level3, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          '${facility?["identifier"]}',
          style: TextStyle(
              fontSize: 40, color: MyColor.level3, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          '${facility?["address"]}',
          style: TextStyle(
              fontSize: 40, color: MyColor.level3, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: MyColor.level2,
            ),
            onPressed: () async {
              await storage.write(key: "jwtMother", value: null);
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginMother()),
              );
            },
            child: const Text(
              "Keluar",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
