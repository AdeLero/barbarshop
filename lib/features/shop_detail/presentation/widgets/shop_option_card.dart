import 'package:barbar_shop/core/utils/app_colors/app_colors.dart';
import 'package:barbar_shop/core/utils/textstyles/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopOptionCard extends HookConsumerWidget {
  final Icon icon;
  final String label;
  const ShopOptionCard({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: BoxConstraints(minWidth: 100.w, minHeight: 80.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.onSecondary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(height: 6.h),
          Text(label, style: AppTextStyles.body),
        ],
      ),
    );
  }
}
