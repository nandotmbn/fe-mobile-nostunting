// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:no_stunting/screens/facility/active/index.dart';
import 'package:no_stunting/screens/mother/home_mother.dart';

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
    return Colors.red;
  }
  return Color.fromARGB(255, 243, 114, 33);
}

class _FormLoginFieldState extends State<FormLoginField> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPasswordSecure = true;
  String serialNumber = "";
  String password = "";

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text("NIK",
                    style: TextStyle(
                        fontSize: 24, color: Color.fromARGB(255, 25, 47, 35))),
              ),
            ),
            TextFormField(
              controller: serialNumberController,
              onChanged: (text) {
                setSerialNumber(text);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'NIK tidak boleh kosong';
                }
                return null;
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text("Kata Sandi",
                    style: TextStyle(
                        fontSize: 24, color: Color.fromARGB(255, 25, 47, 35))),
              ),
            ),
            TextFormField(
              controller: passwordController,
              onChanged: (text) {
                setPassword(text);
              },
              obscureText: !isPasswordSecure,
              enableSuggestions: false,
              autocorrect: false,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Kata sandi tidak boleh kosong';
                }
                return null;
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
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
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 83, 12, 2)),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Color(0xFF395144),
                  ),
                  onPressed: () {
                    setLoading();
                    if (_formKey.currentState!.validate()) {
                      setLoading();
                      serialNumberController.text = "";
                      passwordController.text = "";
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeMother()),
                      );
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
