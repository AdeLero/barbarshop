import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:barbar_shop/core/core.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.onSecondary,
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 72.w,
                height: 72.w,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Image.asset('assets/barber_shop_logo.png'),
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ade Lero',
                      style: AppTextStyles.heading2.copyWith(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Premium member since 2024',
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.primary,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: AppColors.onPrimary,
              ),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  'Lagos, Nigeria',
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.onPrimary,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 14.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.04),
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Row(
              children: [
                Container(
                  width: 42.w,
                  height: 42.w,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.auto_awesome,
                    color: AppColors.background,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Style Rewards',
                        style: AppTextStyles.heading2.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '240 points until your next free beard trim.',
                        style: AppTextStyles.body.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
