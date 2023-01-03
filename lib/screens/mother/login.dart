// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:no_stunting/views/mother/login_mother.dart';

class LoginMother extends StatelessWidget {
  const LoginMother({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFAA8B56),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(child: const FormLoginMother()),
            ),
          )
        ],
      ),
      backgroundColor: const Color(0xFF4E6C50),
    );
  }
}
