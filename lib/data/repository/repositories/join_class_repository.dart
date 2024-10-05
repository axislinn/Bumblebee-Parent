import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JoinClassRepository {
  final String baseUrl =
      'https://bumblebeeflutterdeploy-production.up.railway.app';

  Future<void> joinClass(
      String classCode, String childName, DateTime studentDOB) async {
    print('Class Code: $classCode');
    print('Child Name: $childName');
    print('Date of Birth: ${studentDOB.toIso8601String()}');

    String formattedDate = DateFormat('yyyy MM dd').format(studentDOB);
    print('Date of Birth: $formattedDate');

    final prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString('userToken');

    final String? token = prefs.getString('user_Token');


    final response = await http.post(
      Uri.parse('$baseUrl/api/request/create'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'classCode': classCode,
        'childName': childName,
        'studentDOB': formattedDate,
      }),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (classCode.isEmpty) {
      throw Exception('Class code cannot be empty');
    }

    if (response.statusCode == 404) {
      print('No classes available for the provided code');
      throw Exception('No classes available for the provided code');
    } else if (response.statusCode != 200) {
      print('Failed to join class');
      throw Exception('Failed to join class');
    } else {
      print('Successfully joined class: $classCode');
    }
  }
}
