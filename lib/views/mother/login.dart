// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:no_stunting/constant/color.dart';
// import 'package:no_stunting/screens/facility/active/index.dart';
import 'package:no_stunting/screens/mother/active/home.dart';
import 'package:no_stunting/services/facility_monitor.dart';
import 'package:no_stunting/widgets/input_text_field.dart';
import 'package:no_stunting/widgets/password_text_field.dart';
import 'package:http/http.dart' as http;
import 'package:no_stunting/services/constant.dart';

FacilityMonitorService monitorService = FacilityMonitorService();

class FormLoginMother extends StatelessWidget {
  const FormLoginMother({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            top: 50.0,
            right: 24.0,
            bottom: 0.0,
          ),
          child: Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                child: Text("Masuk sebagai Ibu Hamil",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 25, 47, 35)))),
            Align(alignment: Alignment.centerLeft, child: FormLoginField())
          ])),
    );
  }
}

class FormLoginField extends StatefulWidget {
  const FormLoginField({super.key});

  @override
  _FormLoginFieldState createState() => _FormLoginFieldState();
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return MyColor.level2;
  }
  return MyColor.level2;
}

class _FormLoginFieldState extends State<FormLoginField> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPasswordSecure = true;
  String serialNumber = "";
  String password = "";
  String motherRolesId = "";
  String message = "";

  var serialNumberController = TextEditingController();
  var passwordController = TextEditingController();

  void setLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void setSerialNumber(String serialNum) {
    setState(() {
      serialNumber = serialNum;
    });
  }

  void setPassword(String passwordInput) {
    setState(() {
      password = passwordInput;
    });
  }

  void getMasterRoles() async {
    var response = await monitorService.getMasterRolesData();
    for (var res in response) {
      if (res["name"] == "Mother") {
        setState(() {
          motherRolesId = res["_id"];
        });
      }
    }
  }

  void loginChecker(BuildContext context) async {
    String? jwt = await storage.read(key: "jwtMother");
    if (jwt != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MotherHome()),
      );
    } else {
      // getMasterRoles();
    }
  }

  @override
  void initState() {
    // getMasterRoles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loginChecker(context);
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            InputTextField(setSerialNumber, serialNumberController,
                "Nomor Induk Kependudukan", "NIK tidak boleh kosong"),
            PasswordTextField(
                controller: passwordController,
                setter: setPassword,
                isPasswordSecure: isPasswordSecure,
                message: "Kata sandi tidak boleh kosong",
                title: "Kata sandi"),
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isPasswordSecure,
                    onChanged: (bool? value) {
                      setState(() {
                        isPasswordSecure = value!;
                      });
                    },
                  ),
                  Text(
                    "Tampilkan sandi",
                    style: TextStyle(fontSize: 18, color: MyColor.level4),
                  )
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  message,
                  style: TextStyle(color: MyColor.level4),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: MyColor.level2,
                  ),
                  onPressed: () async {
                    setLoading();
                    setState(() {
                      message = "";
                    });
                    if (_formKey.currentState!.validate()) {
                      final response = await http.post(
                        Uri.parse('$URL_ENDPOINT/auth/login'),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(<String, String>{
                          'identifier': serialNumber,
                          'password': password,
                        }),
                      );

                      if (response.statusCode == 200) {
                        var data = jsonDecode(response.body);
                        await storage.write(
                            key: "jwtMother", value: data["Token"]);
                        String rolesUser =
                            jsonDecode(response.body)["Data"]["rolesId"];

                        if (rolesUser != motherRolesId) {
                          setState(() {
                            message = "Anda bukan ibu hamil";
                          });
                        }

                        setLoading();
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MotherHome()),
                        );
                      } else {
                        setLoading();
                        setState(() {
                          message = jsonDecode(response.body)["Data"];
                        });
                      }
                    } else {
                      setLoading();
                    }
                  },
                  child: !isLoading
                      ? Text(
                          "Masuk",
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )
                      : LoadingAnimationWidget.staggeredDotsWave(
                          // LoadingAnimationwidget that call the
                          color: Colors.white, // staggeredditwave animation
                          size: 30,
                        )),
            )
          ],
        ),
      ),
    );
  }
}
