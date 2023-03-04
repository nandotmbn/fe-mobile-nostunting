import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:no_stunting/services/constant.dart';

const storage = FlutterSecureStorage();

class FacilityPatientsService {
  Future<dynamic> getInitData({
    String name = "",
    String role = "",
  }) async {
    String? jwt = await storage.read(key: "jwtFacility");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.get(
        Uri.parse('$URL_ENDPOINT/facility/patients?name=$name&role=$role'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Data"];
    } else {
      throw Exception('Failed to load member');
    }
  }

  Future<dynamic> registerPatient({
    String firstname = "",
    String lastname = "",
    String identifier = "",
    String password = "",
    String rolesid = "",
    String address = "",
    String date = "",
    bool ismale = false,
  }) async {
    String? jwt = await storage.read(key: "jwtFacility");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.post(Uri.parse('$URL_ENDPOINT/auth/register'),
        headers: requestHeaders,
        body: jsonEncode(<String, dynamic>{
          "firstname": firstname,
          "lastname": lastname,
          "identifier": identifier,
          "password": password,
          "rolesid": rolesid,
          "address": address,
          "bornat": date,
          "ismale": ismale
        }));
    if (response.statusCode == 201) {
      return jsonDecode(response.body)["Data"];
    } else {
      throw Exception(response);
    }
  }

  Future<dynamic> updatePatient(
      {String firstname = "",
      String lastname = "",
      String identifier = "",
      String rolesid = "",
      String address = "",
      String date = "",
      bool ismale = false,
      String id = ""}) async {
    String? jwt = await storage.read(key: "jwtFacility");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.put(Uri.parse('$URL_ENDPOINT/auth/me/$id'),
        headers: requestHeaders,
        body: jsonEncode(<String, dynamic>{
          "firstname": firstname,
          "lastname": lastname,
          "identifier": identifier,
          "rolesid": rolesid,
          "bornat": date,
          "ismale": ismale,
          "address": address
        }));
    if (response.statusCode == 202) {
      return jsonDecode(response.body)["Data"];
    } else {
      throw Exception(response);
    }
  }

  Future<dynamic> getPatientData({required String id}) async {
    String? jwt = await storage.read(key: "jwtFacility");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.get(Uri.parse('$URL_ENDPOINT/auth/me/$id'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Data"];
    } else {
      throw Exception(response);
    }
  }
}
