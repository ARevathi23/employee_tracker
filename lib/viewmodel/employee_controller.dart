import 'package:get/get.dart';
import '../../data/models/employee_model.dart';
import '../../data/services/employee_service.dart';

class EmployeeController extends GetxController {
  final EmployeeService _service = EmployeeService();

  final employees = <Employee>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final selectedFilter = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmployees();
  }

  Future<void> fetchEmployees() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      final result = await _service.fetchEmployees();
      employees.assignAll(result);
    } catch (e) {
      errorMessage.value = e.toString().replaceFirst('Exception: ', '');
      _loadMockData();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshEmployees() async {
    await fetchEmployees();
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  List<Employee> get filteredEmployees {
    switch (selectedFilter.value) {
      case 'Elite':
        return employees.where((e) => e.shouldFlagGreen).toList();
      case 'Active':
        return employees.where((e) => e.isActive).toList();
      case 'Inactive':
        return employees.where((e) => !e.isActive).toList();
      default:
        return employees.toList();
    }
  }

  int get greenFlaggedCount => employees.where((e) => e.shouldFlagGreen).length;

  int get activeCount => employees.where((e) => e.isActive).length;

  void _loadMockData() {
    final mockEmployees = [
      Employee(
        id: 1,
        name: 'Rajesh Kumar',
        email: 'rajesh@example.com',
        phone: '9876543210',
        designation: 'Senior Developer',
        department: 'Engineering',
        dateOfJoining: DateTime(2018, 3, 15),
        isActive: true,
      ),
      Employee(
        id: 2,
        name: 'Priya Sharma',
        email: 'priya@example.com',
        phone: '9876543211',
        designation: 'Project Manager',
        department: 'Management',
        dateOfJoining: DateTime(2019, 7, 1),
        isActive: true,
      ),
      Employee(
        id: 3,
        name: 'Amit Patel',
        email: 'amit@example.com',
        phone: '9876543212',
        designation: 'Team Lead',
        department: 'Engineering',
        dateOfJoining: DateTime(2015, 1, 10),
        isActive: true,
      ),
      Employee(
        id: 4,
        name: 'Sneha Reddy',
        email: 'sneha@example.com',
        phone: '9876543213',
        designation: 'HR Manager',
        department: 'Human Resources',
        dateOfJoining: DateTime(2020, 11, 20),
        isActive: true,
      ),
      Employee(
        id: 5,
        name: 'Vikram Singh',
        email: 'vikram@example.com',
        phone: '9876543214',
        designation: 'QA Engineer',
        department: 'Quality Assurance',
        dateOfJoining: DateTime(2017, 5, 5),
        isActive: false,
      ),
      Employee(
        id: 6,
        name: 'Anita Desai',
        email: 'anita@example.com',
        phone: '9876543215',
        designation: 'UI/UX Designer',
        department: 'Design',
        dateOfJoining: DateTime(2016, 8, 12),
        isActive: true,
      ),
      Employee(
        id: 7,
        name: 'Karthik Nair',
        email: 'karthik@example.com',
        phone: '9876543216',
        designation: 'DevOps Engineer',
        department: 'Engineering',
        dateOfJoining: DateTime(2021, 2, 28),
        isActive: true,
      ),
      Employee(
        id: 8,
        name: 'Meera Joshi',
        email: 'meera@example.com',
        phone: '9876543217',
        designation: 'Data Analyst',
        department: 'Analytics',
        dateOfJoining: DateTime(2014, 6, 1),
        isActive: false,
      ),
    ];
    employees.assignAll(mockEmployees);
  }
}
