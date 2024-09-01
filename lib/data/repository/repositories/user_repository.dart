import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:bumblebee/models/user_model.dart';

class UserRepository {
  final String baseUrl = 'https://bumblebeeflutterdeploy-production.up.railway.app';

    // Method for login
  Future<UserModel> authenticate({required String email, required String password}) async {
    final url = Uri.parse('$baseUrl/login'); 

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
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
    final url = Uri.parse('$baseUrl/register');
    
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
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to register user: ${response.body}');
    }
  }
}
