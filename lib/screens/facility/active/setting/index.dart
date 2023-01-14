import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:no_stunting/screens/facility/login.dart';

import '../index.dart';

const storage = FlutterSecureStorage();

class FacilitySetting extends StatefulWidget {
  const FacilitySetting({super.key});

  @override
  State<FacilitySetting> createState() => _FacilitySettingState();
}

class _FacilitySettingState extends State<FacilitySetting> {
  bool isLoading = false;
  String serialNumber = "";
  String password = "";
  String jwt = "";

  void getJwtToken() async {
    var jwtToken = await storage.read(key: "jwt");
    setState(() {
      jwt = jwtToken!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getJwtToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
        margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            backgroundColor: const Color(0xFF395144),
          ),
          onPressed: () async {
            await storage.write(key: 'jwt', value: null);
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginFacility()),
            );
          },
          child: const Text(
            "Masuk",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        )));
  }
}
