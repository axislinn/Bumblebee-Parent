import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:bumblebee/models/user_model.dart';

class UserRepository {
  final String baseUrl = 'https://bumblebeeflutterdeploy-production.up.railway.app';

  //Method for login
// Future<UserModel> authenticate({required String email, required String password}) async {
//   final url = Uri.parse('$baseUrl/api/auth/login');
//   print('Attempting to authenticate user with email: $email');

//   final response = await http.post(
//     url,
//     headers: {'Content-Type': 'application/json'},
//     body: json.encode({
//       'email': email,
//       'password': password,
//     }),
//   );

//   print('Response status: ${response.statusCode}');
//   print('Response body: ${response.body}');

//   if (response.statusCode == 200) {
//     var jsonResponse = json.decode(response.body);
//     print('Parsed JSON response: $jsonResponse');

//     // Check if status exists and is boolean
//     if (jsonResponse.containsKey('status') && jsonResponse['status'] == true) {
//   print('Login successful, user data: ${jsonResponse['data']}');
//   return UserModel.fromJson(jsonResponse['data']);
// } else {
//   // Print additional details for debugging
//   print('Login failed with message: ${jsonResponse['msg']} and status: ${jsonResponse['status']}');
//   throw Exception('Failed to login: ${jsonResponse['msg']}');
// }

//   } else {
//     print('Failed to login with response: ${response.body}');
//     throw Exception('Failed to login: ${response.body}');
//   }
// }


Future<UserModel> authenticate({required String email, required String password}) async {
  final url = Uri.parse('$baseUrl/api/auth/login');
  print('Attempting to authenticate user with email: $email');

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'email': email,
      'password': password,
    }),
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print('Parsed JSON response: $jsonResponse');

    // Explicitly check for both status and data fields
    if (jsonResponse.containsKey('status') && jsonResponse['status'] == true && jsonResponse.containsKey('data')) {
      print('Login successful, user data: ${jsonResponse['data']}');
      return UserModel.fromJson(jsonResponse['data']);
    } else {
      print('Login failed with message: ${jsonResponse['msg']}');
      throw Exception('Failed to login: ${jsonResponse['msg']}');
    }
  } else {
    print('Failed to login with response: ${response.body}');
    throw Exception('Failed to login: ${response.body}');
  }
}




  // Method for register
  Future<UserModel> register({
    required String userName,
    required String email,
    required String password,
    required String confirmedPassword,
    required String phone,
    required String roles,
    required String relationship,
  }) async {
    final url = Uri.parse('$baseUrl/api/auth/register'); // Updated to match provided function
    //final url = Uri.parse('$baseUrl/http://192.168.100.179:3000/userRegister');
    //final url = Uri.parse('http://192.168.100.179:3000/userRegister');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'userName': userName,
        'email': email,
        'password': password,
        'confirmedPassword': confirmedPassword,
        'phone': phone,
        'roles': roles,
        'relationship': relationship,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse['status']) {
        return UserModel.fromJson(jsonResponse['data']);
      } else {
        throw Exception('Failed to register: ${jsonResponse['message']}');
      }
    } else {
      throw Exception('Failed to register user: ${response.body}');
    }
  }
}
