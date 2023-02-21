// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/services/constant.dart';
import 'package:no_stunting/services/facility_monitor.dart';
import 'package:no_stunting/widgets/input_text_field.dart';
import 'package:no_stunting/widgets/password_text_field.dart';
import '../../screens/facility/active/index.dart';

// Create storage
const storage = FlutterSecureStorage();
FacilityMonitorService monitorService = FacilityMonitorService();

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
          child: Column(children: [
            Container(
                alignment: Alignment.centerLeft,
                child: const Text("Masuk sebagai fasilitas kesehatan",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 25, 47, 35)))),
            const Align(
                alignment: Alignment.centerLeft, child: FormLoginField())
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
  String facilityRolesId = "";
  String message = "";

  var serialNumberController = TextEditingController();
  var passwordController = TextEditingController();

  void loginChecker(BuildContext context) async {
    String? jwt = await storage.read(key: "jwtFacility");
    if (jwt != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const FacilityActive()),
      );
    } else {
      getMasterRoles();
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

  void getMasterRoles() async {
    var response = await monitorService.getMasterRolesData();
    for (var res in response) {
      if (res["name"] == "Facility") {
        setState(() {
          facilityRolesId = res["_id"];
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loginChecker(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputTextField(setSerialNumber, serialNumberController,
              "Nomor Registrasi Faskes", "Nama tidak boleh kosong"),
          PasswordTextField(
              controller: passwordController,
              setter: (text) {
                setPassword(text);
              },
              isPasswordSecure: isPasswordSecure,
              message: "Kata sandi tidak boleh kosong",
              title: "Kata Sandi"),
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
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
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
                      String rolesUser =
                          jsonDecode(response.body)["Data"]["rolesId"];

                      if (rolesUser != facilityRolesId) {
                        setState(() {
                          message = "Anda bukan admin fasilitas kesehatan";
                        });
                        setLoading();
                      } else {
                        await storage.write(
                            key: "jwtFacility", value: data["Token"]);
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FacilityActive()),
                        );
                      }
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
