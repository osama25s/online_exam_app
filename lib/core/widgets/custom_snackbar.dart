import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/core/theme/app_colors.dart';

enum SnackBarType { success, error, warning, info }

class CustomSnackBar {
  // الدالة الأساسية لعرض الـ SnackBar
  static void show({
    required BuildContext context,
    required String message,
    required SnackBarType type,
    Duration duration = const Duration(seconds: 3),
  }) {
    // إخفاء أي SnackBar موجودة
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // عرض الـ SnackBar الجديدة
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _CustomSnackBarContent(message: message, type: type),
        duration: duration,
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 20.h, left: 16.w, right: 16.w),
      ),
    );
  }

  // دوال مختصرة لكل نوع
  static void showSuccess({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context: context,
      message: message,
      type: SnackBarType.success,
      duration: duration,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context: context,
      message: message,
      type: SnackBarType.error,
      duration: duration,
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context: context,
      message: message,
      type: SnackBarType.warning,
      duration: duration,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    show(
      context: context,
      message: message,
      type: SnackBarType.info,
      duration: duration,
    );
  }
}

// Widget الـ SnackBar المخصص
class _CustomSnackBarContent extends StatelessWidget {
  final String message;
  final SnackBarType type;

  const _CustomSnackBarContent({required this.message, required this.type});

  // دالة للحصول على اللون حسب النوع
  Color _getBackgroundColor() {
    switch (type) {
      case SnackBarType.success:
        return AppColors.success; // أخضر
      case SnackBarType.error:
        return AppColors.error; // أحمر
      case SnackBarType.warning:
        return AppColors.warning; // برتقالي
      case SnackBarType.info:
        return AppColors.info; // أزرق
    }
  }

  // دالة للحصول على الأيقونة حسب النوع
  IconData _getIcon() {
    switch (type) {
      case SnackBarType.success:
        return Icons.check_circle;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning;
      case SnackBarType.info:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // الأيقونة
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(_getIcon(), color: Colors.white, size: 24.sp),
          ),
          SizedBox(width: 12.w),

          // الرسالة
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// ============================================
// طريقة الاستخدام في الكود:
// ============================================

/*

 1️⃣ Success SnackBar
CustomSnackBar.showSuccess(
  context: context,
  message: 'OTP sent successfully!',
);

 2️⃣ Error SnackBar
CustomSnackBar.showError(
  context: context,
  message: 'Please enter your email',
);

 3️⃣ Warning SnackBar
CustomSnackBar.showWarning(
  context: context,
  message: 'Passwords do not match',
);

 4️⃣ Info SnackBar
CustomSnackBar.showInfo(
  context: context,
  message: 'Code resent successfully!',
);

 5️⃣ مع تحديد المدة
CustomSnackBar.showSuccess(
  context: context,
  message: 'Success message',
  duration: Duration(seconds: 5),
);

*/