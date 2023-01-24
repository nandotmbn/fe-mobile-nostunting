import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:no_stunting/services/constant.dart';

const storage = FlutterSecureStorage();

class FacilityMonitorService {
  Future<dynamic> getMasterRolesData() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    final response = await http.get(Uri.parse('$URL_ENDPOINT/master'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Data"]["Roles"];
    } else {
      throw Exception('Failed to load member');
    }
  }

  Future<dynamic> getInitData(
      {String name = "",
      String isChecked = "",
      String datetime = "",
      String type = ""}) async {
    String? jwt = await storage.read(key: "jwt");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.get(
        Uri.parse(
            '$URL_ENDPOINT/facility/monitor/calendar?checked=$isChecked&type=$type&datetime=$datetime&name=$name'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load member');
    }
  }

  Future<dynamic> getAllDataById({String id = ""}) async {
    String? jwt = await storage.read(key: "jwt");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.get(
        Uri.parse('$URL_ENDPOINT/facility/monitor/calendar/$id'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(jsonEncode({
        "User": jsonDecode(response.body)["User"],
        "Monitor": jsonDecode(response.body)["Monitor"],
      }));
    } else {
      throw Exception('Failed to load member');
    }
  }

  Future<dynamic> getPreviousComment(
      {required String patientId, required String postId}) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.get(
        Uri.parse(
            '$URL_ENDPOINT/facility/monitor/calendar/$patientId/comment/$postId'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Data"];
    } else {
      throw Exception('Error');
    }
  }

  Future<dynamic> postComment(
      {required String patientId,
      required String postId,
      required String comment}) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final response = await http.post(
      Uri.parse(
          '$URL_ENDPOINT/facility/monitor/calendar/$patientId/comment/$postId'),
      headers: requestHeaders,
      body: jsonEncode(<String, String>{
        'content': comment,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Data"];
    } else {
      throw Exception('Error');
    }
  }
}
