import 'package:barbar_shop/core/theme/app_colors.dart';
import 'package:barbar_shop/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFavoriteShopCard extends StatelessWidget {
  final String name;
  final String distance;
  final String image;

  const ProfileFavoriteShopCard({
    super.key,
    required this.name,
    required this.distance,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 188.w,
      margin: EdgeInsets.only(right: 12.w),
      decoration: BoxDecoration(
        color: AppColors.onSecondary,
        borderRadius: BorderRadius.circular(24.r),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            height: 124.h,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(14.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyles.heading2.copyWith(fontSize: 16.sp),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 16.sp,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      distance,
                      style: AppTextStyles.body.copyWith(color: AppColors.onPrimary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
