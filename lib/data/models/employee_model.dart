class Employee {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String designation;
  final String department;
  final DateTime dateOfJoining;
  final bool isActive;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.designation,
    required this.department,
    required this.dateOfJoining,
    required this.isActive,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      designation: json['designation'] ?? '',
      department: json['department'] ?? '',
      dateOfJoining: DateTime.parse(json['date_of_joining']),
      isActive: json['is_active'] == 1 || json['is_active'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'designation': designation,
      'department': department,
      'date_of_joining': dateOfJoining.toIso8601String().split('T').first,
      'is_active': isActive ? 1 : 0,
    };
  }

  int get yearsOfService {
    final now = DateTime.now();
    int years = now.year - dateOfJoining.year;
    if (now.month < dateOfJoining.month ||
        (now.month == dateOfJoining.month && now.day < dateOfJoining.day)) {
      years--;
    }
    return years;
  }

  bool get shouldFlagGreen => yearsOfService > 5 && isActive;
}
