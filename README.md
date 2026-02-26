# Employee Tracker Mobile App

A cross-platform mobile application for tracking and managing employees across different departments.

## Features
- **Employee List Display**: Comprehensive view of all registered employees.
- **Advanced Filtering**: Categorize employees into:
    - **All**: Every employee on record.
    - **Elite**: Employees with significant tenure (5+ years active).
    - **Active**: Currently employed staff.
    - **Inactive**: Past employees.
- **State Management**: Using `GetX` for reactiveness and smooth performance.
- **API Integration**: Connects to the Laravel backend for real-time data.
- **Fallback Data**: Includes mock data for testing when the API is not reachable.

## Tech Stack
- **Framework**: Flutter (Dart)
- **State Management**: GetX
- **Networking**: Http package
- **Icons**: Material Design

## How to Run

1.  **Requirement**
    - Flutter SDK installed.
    - An emulator or physical device.

2.  **Clone and Install**
    ```bash
    git clone https://github.com/ARevathi23/employee_tracker.git
    cd employee_tracker
    flutter pub get
    ```

3.  **Run Application**
    ```bash
    flutter run
    ```
