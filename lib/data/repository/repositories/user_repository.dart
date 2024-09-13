import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:bumblebee/models/user_model.dart';

class UserRepository {
  final String baseUrl = 'https://bumblebeeflutterdeploy-production.up.railway.app';

  //Method for login
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

    if (jsonResponse.containsKey('con') && jsonResponse['con'] == true) {
      print('Login successful, user data: ${jsonResponse['result']['userInfo']}');
      
      // Pass the correct userInfo object to the UserModel
      return UserModel.fromJson(jsonResponse['result']['userInfo']);
    } else {
      print('Login failed: ${jsonResponse['msg']}');
      throw Exception('Login failed: ${jsonResponse['msg']}');
    }
  } else {
    print('HTTP error: ${response.statusCode}');
    throw Exception('HTTP error: ${response.statusCode}');
  }
}

//mwthod for sign up
Future<UserModel> register({
  required String userName,
  required String email,
  required String password,
  required String confirmedPassword,
  required String phone,
  required String roles,
  required String relationship,
}) async {
  final url = Uri.parse('$baseUrl/api/auth/register');
  
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

  // Print response details for debugging
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  // Parse the response
  var jsonResponse = json.decode(response.body);

  // Print parsed JSON for further inspection
  print('Parsed JSON response: $jsonResponse');

  if (response.statusCode == 200) {
    // Check if `con` field exists and is a boolean
    bool success = jsonResponse['con'] ?? false;
    if (success) {
      // Handle successful registration
      var result = jsonResponse['result'];
      if (result != null && result['user'] != null) {
        // Assuming UserModel.fromJson handles the `user` part of the result
        return UserModel.fromJson(result['user']);
      } else {
        throw Exception('Failed to register: No user data found in response');
      }
    } else {
      // Handle failure scenario based on `msg`
      String message = jsonResponse['msg'] ?? 'Unknown error occurred';
      throw Exception('Failed to register: $message');
    }
  } else {
    // Handle non-200 responses
    throw Exception('HTTP error: ${response.statusCode}, ${response.body}');
  }
}

}
