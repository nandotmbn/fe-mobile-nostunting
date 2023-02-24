import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/screens/child/login.dart';
import 'package:no_stunting/screens/facility/login.dart';
import 'package:no_stunting/services/facility_home.dart';

FacilityHomeService facilityService = FacilityHomeService();

const storage = FlutterSecureStorage();

class ChildSettingView extends StatefulWidget {
  const ChildSettingView({super.key});

  @override
  State<ChildSettingView> createState() => ChildSettingViewState();
}

class ChildSettingViewState extends State<ChildSettingView> {
  bool isLoading = false;
  String serialNumber = "";
  String password = "";
  String jwt = "";
  dynamic facility = {};

  void getJwtToken() async {
    var jwtToken = await storage.read(key: "jwtChild");
    setState(() {
      jwt = jwtToken!;
    });
  }

  void getFacilityHome() async {
    var resultData = await facilityService.getData();
    setState(() {
      facility = resultData["facility"];
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Anda masuk sebagai bayi/balita dengan identitas:',
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
              await storage.write(key: "jwtChild", value: null);
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginChild()),
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
