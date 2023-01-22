// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:app_settings/app_settings.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/views/facility/active/measure/partials/bluetooth_finder.dart';
import 'package:no_stunting/widgets/record_form_head.dart';

// Create storage
const storage = FlutterSecureStorage();
const String _uuid = "6E400001-B5A3-F393-E0A9-E50E24DCCA9E";
const String _uuidDesc = "6E400003-B5A3-F393-E0A9-E50E24DCCA9E";

FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

class FacilityMeasureRecordForm extends StatelessWidget {
  const FacilityMeasureRecordForm({super.key});

  void openBluetoothSettings(BluetoothState state) async {
    if (state == BluetoothState.on) {
      flutterBlue.turnOff();
    } else {
      flutterBlue.turnOn();
    }
    // AppSettings.openBluetoothSettings();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        margin: const EdgeInsets.only(top: 44),
        child: Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 0.0,
            ),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Pengukuran Bayi / Balita",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: MyColor.level4)),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: StreamBuilder<BluetoothState>(
                      stream: flutterBlue.state,
                      initialData: BluetoothState.unknown,
                      builder: (c, snapshot) {
                        final state = snapshot.data;
                        return InkWell(
                          onTap: () {
                            openBluetoothSettings(state!);
                          },
                          splashColor: state == BluetoothState.on
                              ? Colors.green
                              : Colors.red,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: state == BluetoothState.on
                                    ? Colors.green
                                    : Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            width: 120,
                            height: 40,
                            child: Text(
                              state == BluetoothState.on
                                  ? "Bluetooth is On"
                                  : "Bluetooth is Off",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      })),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20, top: 5),
                  child: Text("Menggunakan Bluetooth Low Energy (BLE)",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: MyColor.level4)),
                ),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: FacilityMeasureRecordFormField()),
            ])),
      ),
    );
  }
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
  return const Color.fromARGB(255, 243, 114, 33);
}

class FacilityMeasureRecordFormField extends StatefulWidget {
  const FacilityMeasureRecordFormField({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FacilityMeasureRecordFormFieldState createState() =>
      _FacilityMeasureRecordFormFieldState();
}

class _FacilityMeasureRecordFormFieldState
    extends State<FacilityMeasureRecordFormField> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = true;
  var serialNumberController = TextEditingController();
  var passwordController = TextEditingController();
  late BluetoothDevice choosenDevice;
  late List<BluetoothCharacteristic> characteristics;
  late BluetoothCharacteristic characteristic;

  void setChoosenDevice(BluetoothDevice device) async {
    setState(() {
      choosenDevice = device;
    });

    List<BluetoothService> services = (await device.discoverServices());
    for (var s in services) {
      if (s.uuid.toString().toUpperCase() == _uuid) {
        setState(() {
          characteristics = s.characteristics;
        });
      }
    }

    for (var c in characteristics) {
      if (c.uuid.toString().toUpperCase() == _uuidDesc) {
        setState(() {
          characteristic = c;
        });
      }
    }

    await characteristic.setNotifyValue(!characteristic.isNotifying);
    await characteristic.read();

    setState(() {
      isLoading = false;
    });
  }

  void setLoading() {
    choosenDevice.requestMtu(512);
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: isLoading
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RecordFormHead(
                                title: "Berat badan", content: '0.0 Kg'),
                            RecordFormHead(
                                title: "Tinggi badan", content: '0.0 cm'),
                          ],
                        )
                      : StreamBuilder<List<int>>(
                          stream: characteristic.value,
                          initialData: characteristic.lastValue,
                          builder: (c, snapshot) {
                            final value = snapshot.data;
                            String txt = "";
                            for (var v in value!) {
                              txt = txt + String.fromCharCode(v);
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RecordFormHead(
                                    title: "Berat badan",
                                    content: '${jsonDecode(txt)["w"]} Kg'),
                                RecordFormHead(
                                    title: "Tinggi badan",
                                    content: '${jsonDecode(txt)["h"]} cm'),
                              ],
                            );
                          })),
              Expanded(
                  flex: 3,
                  child: BluetoothFinder(
                    setChoosenDevice: setChoosenDevice,
                    setLoading: (bool stats) {
                      setState(() {
                        isLoading = stats;
                      });
                    },
                  ))
            ],
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
                },
                child: !isLoading
                    ? const Text("Refresh")
                    : LoadingAnimationWidget.staggeredDotsWave(
                        // LoadingAnimationwidget that call the
                        color: Colors.white, // staggeredditwave animation
                        size: 30,
                      )),
          ),
        ],
      ),
    );
  }
}
