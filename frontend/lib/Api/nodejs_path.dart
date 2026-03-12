// ignore_for_file: avoid_print, depend_on_referenced_packages, prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:http/http.dart' as http;

class API {
  static const baseUrl = "http://192.168.0.213:3000";

  static Future<void> logIn(Map<String, dynamic> data) async {
    var value = Uri.parse(baseUrl + "/login");
    print("─────────────────────────");
    print("📤 Sending to: $value");
    print("📤 Sending data: $data");
    print("─────────────────────────");
    print("Request Body: $data");

    try {
      final response = await http.post(
        value,
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(data),
      );

      // ✅ Step 1: decode response.body — NOT data
      final responseBody = jsonDecode(response.body);
      print("Response Body: $responseBody");

      if (response.statusCode == 200) {
        // ✅ Step 2: read token from responseBody
        String token = responseBody['token'];
        var user = responseBody['user'];

        print('My token is: $token');
        print('User: $user');
      } else {
        // ✅ Step 3: read error message from responseBody
        print('Error: ${responseBody['message']}');
      }
    } catch (e) {
      print("An error occurred: $e");
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

//   static Future<List<dynamic>> getUsers() async {
//     var value = Uri.parse(baseUrl + "outPutDetails");
//     try {
//       final response = await http.get(value);
//       if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(response.body);
//         return jsonResponse['data'];
//       } else {
//         print("Failed to load users. Status code: ${response.statusCode}");
//         return [];
//       }
//     } catch (e) {
//       print("An error occurred while fetching users: $e");
//       return [];
//     }
//   }

//   static Future<Map<String, dynamic>?> getUserById(int id) async {
//     var value = Uri.parse(baseUrl + "users/$id");
//     try {
//       final response = await http.get(value);
//       if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(response.body);
//         return jsonResponse['data'];
//       } else {
//         print("Failed to load user. Status code: ${response.statusCode}");
//         return null;
//       }
//     } catch (e) {
//       print("An error occurred while fetching user: $e");
//       return null;
//     }
//   }

//   static Future<Map<String, dynamic>?> deleteUser(int id) async {
//     var value = Uri.parse(baseUrl + "users/delete/$id");
//     try {
//       final response = await http.delete(value);
//       if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(response.body);
//         return jsonResponse['data'];
//       } else {
//         print("Failed to load user. Status code: ${response.statusCode}");
//         return null;
//       }
//     } catch (e) {
//       print("An error occurred while fetching user: $e");
//       return null;
//     }
//   }

//   static Future<bool> updateUser(int id, Map<String, dynamic> data) async {
//     var value = Uri.parse(baseUrl + "users/update/$id");
//     print("Request Body for update: $data");

//     try {
//       final response = await http.put(
//         value,
//         headers: {'Content-Type': 'application/json; charset=UTF-8'},
//         body: jsonEncode(data),
//       );

//       if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(response.body);
//         print("Update Response JSON: $jsonResponse");
//         return true;
//       } else {
//         print("Failed to update user. Status code: ${response.statusCode}");
//         print("Response body: ${response.body}");
//         return false;
//       }
//     } catch (e) {
//       print("An error occurred while updating user: $e");
//       return false;
//     }
//   }

//   static Future laravelGetUsers() async {}

// }
