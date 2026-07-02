import 'package:barbar_shop/core/theme/app_colors.dart';
import 'package:barbar_shop/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStatCard extends StatelessWidget {
  final String value;
  final String label;

  const ProfileStatCard({
    super.key,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.onSecondary,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: AppTextStyles.heading2.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: AppTextStyles.body.copyWith(color: AppColors.onPrimary),
          ),
        ],
      ),
    );
  }
}
