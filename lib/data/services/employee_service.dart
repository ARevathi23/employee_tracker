import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/employee_model.dart';
import 'api_constants.dart';

class EmployeeService {
  Future<List<Employee>> fetchEmployees() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}${ApiConstants.employeesEndpoint}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);

        if (body['status'] == true && body['data'] != null) {
          final List<dynamic> data = body['data'];
          return data.map((json) => Employee.fromJson(json)).toList();
        } else {
          throw Exception(body['message'] ?? 'Failed to load employees');
        }
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to server: $e');
    }
  }
}
