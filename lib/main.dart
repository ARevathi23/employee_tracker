import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/screens/employee_list_screen.dart';
import 'view/theme/app_theme.dart';

void main() {
  runApp(const EmployeeTrackerApp());
}

class EmployeeTrackerApp extends StatelessWidget {
  const EmployeeTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Employee Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const EmployeeListScreen(),
    );
  }
}
