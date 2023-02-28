import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:no_stunting/services/constant.dart';

const storage = FlutterSecureStorage();

class MotherCalendarService {
  Future<dynamic> getData() async {
    String? jwt = await storage.read(key: "jwtMother");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.get(Uri.parse('$URL_ENDPOINT/mother/calendar'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Data"];
    }
  }

  Future<dynamic> postMonitoring({required String comment}) async {
    String? jwt = await storage.read(key: "jwtMother");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}',
    };

    final response = await http.post(
      Uri.parse('$URL_ENDPOINT/patient/monitor/record'),
      headers: requestHeaders,
      body: jsonEncode(<String, String>{
        'content': comment,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
