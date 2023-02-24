import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:no_stunting/views/facility/active/setting/index.dart';

const storage = FlutterSecureStorage();

class FacilitySetting extends StatefulWidget {
  const FacilitySetting({super.key});

  @override
  State<FacilitySetting> createState() => _FacilitySettingState();
}

class _FacilitySettingState extends State<FacilitySetting> {
  @override
  Widget build(BuildContext context) {
    return const FacilitySettingView();
  }
}
