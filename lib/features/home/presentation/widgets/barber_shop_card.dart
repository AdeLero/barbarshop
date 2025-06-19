import 'dart:ui';

import 'package:barbar_shop/core/utils/app_colors/app_colors.dart';
import 'package:barbar_shop/core/utils/textstyles/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarberShopCard extends StatelessWidget {
  final String name;
  final String distance;
  final String image;
  const BarberShopCard({
    super.key,
    required this.name,
    required this.distance,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Image.asset(
            image,
            height: 200.h,
            width: 1.sw,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 12.h,
          right: 12.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: AppColors.onPrimary.withOpacity(0.3), // translucent color
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 4.w,),
                    Text(
                      "Save",
                      style: AppTextStyles.body.copyWith(color: Colors.white), // optional: make text pop
                    ),
                    SizedBox(width: 8.w),
                    CircleAvatar(
                      backgroundColor: AppColors.primary,
                      child: Icon(Icons.bookmarks_outlined, color: AppColors.background, size: 18,),
                    ),
                  ],
                ),
              ),
            ),
          )

        ),
        Positioned(
          bottom: 16.h,
          left: 16.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: EdgeInsets.all(16.w),
                width: 1.sw - 48.w,
                decoration: BoxDecoration(
                  color: AppColors.onPrimary.withOpacity(0.3), // translucent color
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: AppTextStyles.heading2),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text(distance, style: AppTextStyles.body),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      child: Icon(Icons.arrow_upward, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
