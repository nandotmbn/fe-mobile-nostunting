import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:no_stunting/services/constant.dart';

const storage = FlutterSecureStorage();

class FacilityMeasureService {
  Future<List> getChildrenData({String name = ""}) async {
    String? jwt = await storage.read(key: "jwtFacility");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.get(
        Uri.parse('$URL_ENDPOINT/facility/measure?name=$name'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Data"] as List;
    }

    return [];
  }

  Future<dynamic> getPatientData({required String id}) async {
    String? jwt = await storage.read(key: "jwtFacility");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.get(
        Uri.parse('$URL_ENDPOINT/facility/measure/patient/$id'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Data"];
    }

    return [];
  }

  Future<dynamic> recordMeasurement(
      {required String id,
      required double height,
      required double weight}) async {
    String? jwt = await storage.read(key: "jwtFacility");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.post(
      Uri.parse('$URL_ENDPOINT/facility/measure/record'),
      headers: requestHeaders,
      body: jsonEncode(<String, dynamic>{
        'height': height,
        'weight': weight,
        'patientid': id,
      }),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }

    return [];
  }
}
