// ignore_for_file: avoid_print, depend_on_referenced_packages, prefer_interpolation_to_compose_strings
import 'dart:convert';
import 'package:ElectraGo/Service/service.dart';
import 'package:http/http.dart' as http;

class API {
  static const baseUrl = "http://192.168.0.213:3000";

  static Future<bool> logIn(Map<String, dynamic> data) async {
  var value = Uri.parse(baseUrl + "/login");
  print("📤 Sending to: $value");
  print("📤 Sending data: $data");

  try {
    final response = await http.post(
      value,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(data),
    );

    final responseBody = jsonDecode(response.body);
    print("Response Body: $responseBody");

    if (response.statusCode == 200) {
      String token = responseBody['token'];
      print('✅ Token received: $token');

      // ── NEW: Save token to secure storage ──────────────
      await StorageService.saveToken(token);
      await StorageService.saveEmail(data['email']);
      print('✅ Token saved to device!');

      return true;
    } else {
      print('❌ Failed: ${responseBody['message']}');
      return false;
    }

  } catch (e) {
    print("❌ Error: $e");
    return false;
  }
}

  static Future<void> authInfo(Map<String, dynamic> data) async {
    var value = Uri.parse(baseUrl + "/authInfo");
    print("Request Body: $data");

    try {
      final response = await http.post(
        value,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print("Response JSON: $jsonResponse");
      } else {
        print("Failed to load data. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }

  static Future<void> postProfileData(Map<String, dynamic> data) async {
    var value = Uri.parse(baseUrl + "/profileData");
    print("Request Body: $data");

    try {
      final response = await http.post(
        value,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print("Response JSON: $jsonResponse");
      } else {
        print("Failed to load data. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("An error occurred: $e");
    }
  }
}
