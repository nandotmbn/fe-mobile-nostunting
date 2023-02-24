// ignore_for_file: use_key_in_widget_constructors, use_build_context_synchronously, must_be_immutable, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:no_stunting/constant/color.dart';

FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

class BluetoothFinder extends StatefulWidget {
  Function setChoosenDevice, setLoading;

  BluetoothFinder({required this.setChoosenDevice, required this.setLoading});

  @override
  State<BluetoothFinder> createState() => _BluetoothFinderState();
}

class _BluetoothFinderState extends State<BluetoothFinder> {
  late BluetoothDevice choosenDevice;

  @override
  Widget build(BuildContext context) {
    void setChoosenDevice(BluetoothDevice device) {
      widget.setChoosenDevice(device);
    }

    return SizedBox(
        child: Column(children: [
      Align(
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pilihan koneksi pengukuran",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: MyColor.level4),
            ),
            ElevatedButton(
                onPressed: () {
                  FlutterBluePlus.instance
                      .startScan(timeout: const Duration(seconds: 10));
                },
                child: const Text("Cari",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color.fromARGB(255, 255, 255, 255))))
          ],
        ),
      ),
      StreamBuilder<List<ScanResult>>(
          stream: FlutterBluePlus.instance.scanResults,
          initialData: const [],
          builder: (c, snapshot) => Column(
                children: snapshot.data!.map(
                  (r) {
                    BluetoothDevice deviceName = r.device;
                    if (deviceName.type != BluetoothDeviceType.le) {
                      return const SizedBox.shrink();
                    }
                    if (deviceName.name != "SENSSUN Growth") {
                      return const SizedBox.shrink();
                    }

                    return Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        decoration: BoxDecoration(color: MyColor.level4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    deviceName.name,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    deviceName.id.toString(),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                StreamBuilder<BluetoothDeviceState>(
                                    stream: deviceName.state,
                                    initialData:
                                        BluetoothDeviceState.connecting,
                                    builder: (context, snapshot) {
                                      String buttonTitle = "Sambung";
                                      switch (snapshot.data) {
                                        case BluetoothDeviceState.connected:
                                          buttonTitle = "Tersambung";
                                          break;
                                        case BluetoothDeviceState.disconnected:
                                          break;
                                        default:
                                      }
                                      return InkWell(
                                        onTap: () async {
                                          if (snapshot.data ==
                                              BluetoothDeviceState.connected) {
                                            deviceName.disconnect();
                                            widget.setLoading(false);
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              setChoosenDevice(deviceName);
                                            });
                                          } else {
                                            deviceName.connect();
                                            widget.setLoading(true);
                                            Future.delayed(
                                                const Duration(seconds: 2), () {
                                              setChoosenDevice(deviceName);
                                            });
                                          }
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            decoration: BoxDecoration(
                                                color: MyColor.level1,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10.0))),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 16),
                                            child: Text(
                                              buttonTitle,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            )),
                                      );
                                    }),
                              ],
                            )
                          ],
                        ));
                  },
                ).toList(),
              )),
    ]));
  }
}
