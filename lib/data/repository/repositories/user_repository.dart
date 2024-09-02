import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:bumblebee/models/user_model.dart';

class UserRepository {
  final String baseUrl = 'https://bumblebeeflutterdeploy-production.up.railway.app';

  // Method for login
Future<UserModel> authenticate({required String email, required String password}) async {
  final url = Uri.parse('$baseUrl/api/auth/login'); // Updated to match provided function

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    print('response is ' + response.body);

    // Ensure jsonResponse['status'] is not null and is a boolean
    if (jsonResponse['status'] != null && jsonResponse['status'] is bool && jsonResponse['status']) {
      // Use UserModel for further user handling
      return UserModel.fromJson(jsonResponse['data']);
    } else {
      // Handle cases where 'status' is not a boolean or is false
      throw Exception('Failed to login: ${jsonResponse['msg']}');
    }
  } else {
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
