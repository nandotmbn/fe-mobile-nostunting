import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:no_stunting/services/constant.dart';

const storage = FlutterSecureStorage();

class FacilityHomeService {
  Future<dynamic> getData() async {
    var date__ = DateFormat("yyyy-MM-dd").format(DateTime.now());
    var newDate =
        DateTime.parse(date__).add(const Duration(hours: -7)).toIso8601String();
    print(newDate);
    String? jwt = await storage.read(key: "jwtFacility");
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${jwt!}'
    };
    final response = await http.get(
        Uri.parse('$URL_ENDPOINT/facility?datetime=${newDate}Z'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["Data"];
    }
  }
}
