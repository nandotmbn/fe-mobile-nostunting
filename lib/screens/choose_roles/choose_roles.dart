// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:no_stunting/views/login/choose_roles.dart';

class ChooseRolesLogin extends StatelessWidget {
  const ChooseRolesLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF4E6C50),
      body: ChooseRolesView(),
    );
  }
}
