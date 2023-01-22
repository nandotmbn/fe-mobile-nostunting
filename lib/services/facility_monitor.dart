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
      // print(response);
      return jsonDecode(response.body)["Data"]["Roles"];
    } else {
      throw Exception('Failed to load member');
    }
  }
}
