// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/constant.dart';
import 'package:no_stunting/widgets/input_text_field.dart';
import '../../screens/facility/active/index.dart';

// Create storage
const storage = FlutterSecureStorage();

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            top: 50.0,
            right: 24.0,
            bottom: 0.0,
          ),
          child: Column(children: const [
            Text("Masuk sebagai fasilitas kesehatan",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 25, 47, 35))),
            Align(alignment: Alignment.centerLeft, child: FormLoginField())
          ])),
    );
  }
}

class FormLoginField extends StatefulWidget {
  const FormLoginField({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
  bool isPasswordSecure = false;
  String serialNumber = "";
  String password = "";

  var serialNumberController = TextEditingController();
  var passwordController = TextEditingController();

  void test(BuildContext context) async {
    String? jwt = await storage.read(key: "jwt");
    if (jwt != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FacilityActive()),
      );
    }
  }

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
    test(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputTextField(setSerialNumber, serialNumberController,
              "Nomor Registrasi Faskes", "Nama tidak boleh kosong"),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text("Kata Sandi",
                  style: TextStyle(fontSize: 24, color: MyColor.level2)),
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
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              filled: true,
              fillColor: const Color(0xFFD9D9D9),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Kata sandi boleh kosong';
              }
              return null;
            },
          ),
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
                  style: TextStyle(fontSize: 18, color: MyColor.level1),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: MyColor.level2,
                ),
                onPressed: () async {
                  setLoading();
                  if (_formKey.currentState!.validate()) {
                    final response = await http.post(
                      Uri.parse('http://$URL_ENDPOINT:8080/v1/auth/login'),
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
                      await storage.write(key: 'jwt', value: data["Token"]);

                      setLoading();
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FacilityActive()),
                      );
                    } else {
                      setLoading();
                      // If the server did not return a 200 OK response,
                      // then throw an exception.
                      throw Exception('Failed to load album');
                    }
                  } else {
                    setLoading();
                  }
                },
                child: !isLoading
                    ? const Text(
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
    );
  }
}
