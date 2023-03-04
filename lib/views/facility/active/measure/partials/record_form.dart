// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, non_constant_identifier_names, unnecessary_null_comparison, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:no_stunting/constant/color.dart';
import 'package:no_stunting/screens/facility/active/monitor/child_record_detail.dart';
import 'package:no_stunting/services/facility_measure.dart';
import 'package:no_stunting/views/facility/active/measure/partials/bluetooth_finder.dart';
import 'package:no_stunting/widgets/record_form_head.dart';

// Create storage
const storage = FlutterSecureStorage();
const String _uuid = "0000FFF0-0000-1000-8000-00805F9B34FB";
const String _uuidDesc = "0000FFF1-0000-1000-8000-00805F9B34FB";
FacilityMeasureService facilityService = FacilityMeasureService();

FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
// 00001800-0000-1000-8000-00805F9B34FB
// 00001801-0000-1000-8000-00805F9B34FB
// 0000FFF0-0000-1000-8000-00805F9B34FB
// F000FFC0-0451-4000-B000-000000000000

// 0000FFF2-0000-1000-8000-00805F9B34FB
// 0000FFF1-0000-1000-8000-00805F9B34FB

class FacilityMeasureRecordForm extends StatefulWidget {
  String id;
  FacilityMeasureRecordForm({required this.id});

  @override
  State<FacilityMeasureRecordForm> createState() =>
      _FacilityMeasureRecordFormState();
}

class _FacilityMeasureRecordFormState extends State<FacilityMeasureRecordForm> {
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
              Align(
                  alignment: Alignment.centerLeft,
                  child: FacilityMeasureRecordFormField(id: widget.id)),
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
  String id;
  FacilityMeasureRecordFormField({required this.id});

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

  void disconnectAllBluetooth() async {
    // Start scanning
    flutterBlue.startScan(timeout: const Duration(seconds: 4));

    flutterBlue.scanResults.listen((results) {
      // do something with scan results
      for (ScanResult r in results) {
        r.device.disconnect();
      }
    });

    flutterBlue.stopScan();
  }

  void navigatorToRecordList() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return FacilityChildRecordDetail(widget.id);
      }),
    );
  }

  @override
  void dispose() {
    disconnectAllBluetooth();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = 0, weight = 0;

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
                            final value = snapshot.data!;
                            weight = (value[2] * 256 + value[3]) / 1000;
                            height = (value[6] * 256 + value[7]) / 10;

                            // setMeasurement(value);

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RecordFormHead(
                                    title: "Berat badan",
                                    content:
                                        '${((value[2] * 256 + value[3]) / 1000).toStringAsFixed(2)} Kg'),
                                RecordFormHead(
                                    title: "Tinggi badan",
                                    content:
                                        '${((value[6] * 256 + value[7]) / 10).toStringAsFixed(2)} cm'),
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
                  dynamic result = await facilityService.recordMeasurement(
                      id: widget.id, height: height, weight: weight);
                  if (result["status"] == 201) {
                    navigatorToRecordList();
                  }
                },
                child: const Text("Rekam")),
          ),
        ],
      ),
    );
  }
}
