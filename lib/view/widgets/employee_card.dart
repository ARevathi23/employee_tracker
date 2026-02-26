import 'package:flutter/material.dart';
import '../../data/models/employee_model.dart';
import '../theme/app_theme.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final VoidCallback? onTap;

  const EmployeeCard({super.key, required this.employee, this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isElite = employee.shouldFlagGreen;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient:
            isElite
                ? const LinearGradient(
                  colors: [Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                : null,
        color: isElite ? null : AppColors.cardBg,
        border: Border.all(
          color: isElite ? AppColors.starGreenBorder : Colors.transparent,
          width: isElite ? 1.5 : 0,
        ),
        boxShadow: [
          BoxShadow(
            color:
                isElite
                    ? AppColors.starGreen.withValues(alpha: 0.15)
                    : Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildAvatar(isElite),
                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              employee.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color:
                                    isElite
                                        ? AppColors.starGreenDark
                                        : AppColors.textPrimary,
                              ),
                            ),
                          ),
                          _buildStatusChip(),
                        ],
                      ),
                      const SizedBox(height: 3),

                      Text(
                        employee.designation,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),

                      Row(
                        children: [
                          _infoChip(
                            Icons.apartment_rounded,
                            employee.department,
                          ),
                          const Spacer(),
                          _infoChip(
                            Icons.schedule_rounded,
                            '${employee.yearsOfService} yrs',
                            highlight: isElite,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                if (isElite) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: AppColors.greenGradient,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.starGreen.withValues(alpha: 0.35),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.workspace_premium_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(bool isElite) {
    final initials =
        employee.name
            .split(' ')
            .take(2)
            .map((e) => e.isNotEmpty ? e[0] : '')
            .join()
            .toUpperCase();

    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isElite ? AppColors.greenGradient : AppColors.primaryGradient,
      ),
      child: CircleAvatar(
        radius: 22,
        backgroundColor:
            isElite ? AppColors.starGreenBg : const Color(0xFFE3F2FD),
        child: Text(
          initials,
          style: TextStyle(
            color: isElite ? AppColors.starGreenDark : AppColors.primary,
            fontWeight: FontWeight.w800,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color:
            employee.isActive
                ? AppColors.activeStatus.withValues(alpha: 0.12)
                : AppColors.inactiveStatus.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color:
              employee.isActive
                  ? AppColors.activeStatus.withValues(alpha: 0.3)
                  : AppColors.inactiveStatus.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  employee.isActive
                      ? AppColors.activeStatus
                      : AppColors.inactiveStatus,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            employee.isActive ? 'Active' : 'Inactive',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color:
                  employee.isActive
                      ? AppColors.activeStatus
                      : AppColors.inactiveStatus,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoChip(IconData icon, String label, {bool highlight = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: highlight ? AppColors.starGreenDark : AppColors.textSecondary,
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: highlight ? FontWeight.w700 : FontWeight.w500,
            color:
                highlight ? AppColors.starGreenDark : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
