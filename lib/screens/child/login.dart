// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api, avoid_single_cascade_in_expression_statements

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/firebase_options.dart';
import 'package:no_stunting/views/child/login.dart';
import 'package:no_stunting/views/mother/login.dart';

FirebaseMessaging messaging = FirebaseMessaging.instance;

class LoginChild extends StatefulWidget {
  const LoginChild({super.key});

  @override
  State<LoginChild> createState() => _LoginChildState();
}

class _LoginChildState extends State<LoginChild> {
  String fcm_token = "";

  void facilityCloudMessagingInit() async {
    messaging
      ..getToken().then((token) {
        setState(() {
          fcm_token = token!;
        });
      });
  }

  @override
  void initState() {
    facilityCloudMessagingInit();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 1,
              child: Image.asset('assets/img/baby.png',
                  width: 250.0, height: 250.0)),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: MyColor.level3,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                  child: FormLoginChild(
                fcmToken: fcm_token,
              )),
            ),
          )
        ],
      ),
      backgroundColor: MyColor.level4,
    );
  }
}
