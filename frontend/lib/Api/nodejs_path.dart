// ignore_for_file: avoid_print, depend_on_referenced_packages, prefer_interpolation_to_compose_strings
import 'dart:convert';
import 'package:ElectraGo/Service/service.dart';
import 'package:http/http.dart' as http;

class API {
  static const baseUrl = "http://192.168.0.213:3000";

  static Future<bool> logIn(Map<String, dynamic> data) async {
    var value = Uri.parse(baseUrl + "/login");
    print("Sending to:-->\n $value");
    print("Sending data:-->\n $data");

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
        print('Token received:-->\n $token');

        // ── NEW: Save token to secure storage ──────────────
        await StorageService.saveToken(token);
        await StorageService.saveEmail(data['email']);
        print('Token saved to device!!!');

        return true;
      } else {
        print('Failed: ${responseBody['message']}');
        return false;
      }
    } catch (e) {
      print("Error: $e");
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

  static Future<Map<String, dynamic>?> getProfile() async {
    try {
      // Step 1: Get token from secure storage
      final token = await StorageService.getToken();

      if (token == null) {
        print('No token found');
        return null;
      }

      // Step 2: Send GET request WITH token in header
      final response = await http.get(
        Uri.parse(baseUrl + '/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer $token', // ← this is how server knows who you are
        },
      );

      final responseBody = jsonDecode(response.body);
      print('Profile response: $responseBody');

      if (response.statusCode == 200) {
        return responseBody['user']; // { id, userName, email, created_at }
      }

      // Token expired during app use
      if (response.statusCode == 401) {
        print('Token expired!!! Clearing session and logging out');
        await StorageService.deleteToken();
        return null;
      }

      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<bool> updateProfile(String userName) async {
    try {
      final token = await StorageService.getToken();

      if (token == null) return false;

      final response = await http.put(
        Uri.parse(baseUrl + '/updateProfile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({'userName': userName}),
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('Profile updated:-->\n ${responseBody['userName']}');
        return true;
      } else {
        print('Failed:-->\n ${responseBody['message']}');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  static Future<bool> verifyTokenWithServer() async {
    final token = await StorageService.getToken();

    // No token at all → definitely not logged in
    if (token == null) return false;

    try {
      final response = await http.get(
        Uri.parse('http://192.168.0.213:3000/verifyToken'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('Token is valid');
        return true; // token still good
      } else {
        print('Token expired — clearing session');
        await StorageService.deleteToken();
        return false;
      }
    } catch (e) {
      print('Server error from catch side: $e');
      return false; // treat server errors as "not logged in"
    }
  }
}
