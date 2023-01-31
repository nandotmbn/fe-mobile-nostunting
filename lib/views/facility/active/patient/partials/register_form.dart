// ignore_for_file: no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/screens/facility/active/index.dart';
import 'package:no_stunting/screens/facility/active/patient/index.dart';
import 'package:no_stunting/services/facility_patients.dart';
import 'package:no_stunting/views/facility/active/measure/partials/record_form.dart';
import 'package:no_stunting/views/facility/active/patient/index.dart';
import 'package:no_stunting/widgets/dropdown_field.dart';
import 'package:no_stunting/widgets/input_text_field.dart';
import 'package:no_stunting/widgets/password_text_field.dart';

FacilityPatientsService facilityPatientService = FacilityPatientsService();

class FacilityPatientRegisterForm extends StatefulWidget {
  const FacilityPatientRegisterForm({super.key});

  @override
  State<FacilityPatientRegisterForm> createState() =>
      _FacilityPatientRegisterFormState();
}

class _FacilityPatientRegisterFormState
    extends State<FacilityPatientRegisterForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isPasswordSecure = false;
  String firstName = "";
  String lastName = "";
  String serialNumber = "";
  String address = "";
  String password = "";
  String passwordConf = "";
  List<String> typeOptions = ["Ibu", "Anak"];
  String type = "Ibu";
  String childId = "Ibu";
  String motherId = "Ibu";

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var serialNumberController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfController = TextEditingController();

  void setFirstName(String _name) {
    setState(() {
      firstName = _name;
    });
  }

  void setLastName(String _name) {
    setState(() {
      lastName = _name;
    });
  }

  void setType(String _type) {
    setState(() {
      type = _type;
    });
  }

  void setAddress(String _address) {
    setState(() {
      address = _address;
    });
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

  void setConfPassword(String passwordInput) {
    setState(() {
      passwordConf = passwordInput;
    });
  }

  void getMasterData() async {
    var resultData = await facilityMonitorService.getMasterRolesData();
    for (var type in resultData) {
      if (type["name"] == "Child") {
        setState(() {
          childId = type["_id"];
        });
      } else if (type["name"] == "Mother") {
        setState(() {
          motherId = type["_id"];
        });
      }
    }
  }

  @override
  void initState() {
    getMasterData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputTextField(setFirstName, firstNameController, "Nama Depan Pasien",
              "Nama tidak boleh kosong"),
          InputTextField(setLastName, lastNameController,
              "Nama Belakang Pasien", "Nama tidak boleh kosong"),
          InputTextField(setSerialNumber, serialNumberController,
              "Nomor Induk Kependudukan", "NIK tidak boleh kosong"),
          DropdownField(
            setter: setType,
            dropdownValue: type,
            options: typeOptions,
            label: "Tipe Pasien",
          ),
          InputTextField(setAddress, addressController, "Alamat",
              "Alamat tidak boleh kosong"),
          PasswordTextField(
              controller: passwordController,
              setter: setPassword,
              isPasswordSecure: isPasswordSecure,
              message: "Password tidak boleh kosong",
              title: "Password"),
          PasswordTextField(
              controller: passwordConfController,
              setter: setConfPassword,
              isPasswordSecure: isPasswordSecure,
              message: "Konfirmasi password tidak boleh kosong",
              title: "Konfirmasi Password"),
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
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: MyColor.level4,
                ),
                onPressed: () async {
                  setLoading();
                  if (_formKey.currentState!.validate()) {
                    var _ = await facilityPatientService.registerPatient(
                        address: address,
                        firstname: firstName,
                        identifier: serialNumber,
                        lastname: lastName,
                        password: password,
                        rolesid: type == "Ibu" ? motherId : childId);
                    setLoading();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FacilityActive()),
                    );
                  } else {
                    setLoading();
                  }
                },
                child: !isLoading
                    ? Text(
                        "Masuk",
                        style: TextStyle(color: MyColor.level1, fontSize: 24),
                      )
                    : LoadingAnimationWidget.waveDots(
                        // LoadingAnimationwidget that call the
                        color: MyColor.level1, // staggeredditwave animation
                        size: 30,
                      )),
          )
        ],
      ),
    );
  }
}
