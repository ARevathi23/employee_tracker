import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF1E88E5);
  static const Color accent = Color(0xFF42A5F5);

  static const Color starGreen = Color(0xFF00C853);
  static const Color starGreenDark = Color(0xFF009624);
  static const Color starGreenBg = Color(0xFFE8F5E9);
  static const Color starGreenBorder = Color(0xFF69F0AE);

  static const Color activeStatus = Color(0xFF00E676);
  static const Color inactiveStatus = Color(0xFFFF5252);

  static const Color scaffoldBg = Color(0xFFF0F2F8);
  static const Color cardBg = Colors.white;
  static const Color darkSurface = Color(0xFF0D2137);

  static const Color textPrimary = Color(0xFF0D2137);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textWhite = Colors.white;

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF1565C0), Color(0xFF1E88E5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient greenGradient = LinearGradient(
    colors: [Color(0xFF00C853), Color(0xFF69F0AE)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [Color(0xFF0D2137), Color(0xFF102A43)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: AppColors.scaffoldBg,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textWhite,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
