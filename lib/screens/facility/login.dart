// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/views/facility/login.dart';

class LoginFacility extends StatelessWidget {
  const LoginFacility({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Expanded(
                flex: 1,
                child: Image.asset('assets/img/hospital.png',
                    width: 250.0, height: 250.0)),
          ),
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
              child: SingleChildScrollView(child: const FormLogin()),
            ),
          )
        ],
      ),
      backgroundColor: MyColor.level4,
    );
  }
}
