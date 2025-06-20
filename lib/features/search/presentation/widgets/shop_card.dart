import 'package:barbar_shop/core/utils/app_colors/app_colors.dart';
import 'package:barbar_shop/core/utils/textstyles/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShopCard extends StatelessWidget {
  final String name;
  final String image;
  const ShopCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24.r),
      child: Stack(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: 1.sw,
            height: 1.sh,
            errorBuilder: (context, error, stackTrace) => Container(
              color: AppColors.onSecondary,
              child: Center(child: Text('Image Error', style: AppTextStyles.body)),
            ),
          ),
          Positioned(
            top: 20.h,
            left: 20.w,
            child: Text(
              name,
              style: AppTextStyles.heading1.copyWith(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print('Book Now tapped for $name');
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: AppColors.background,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r), // Responsive rounded corners
                      ),
                      padding: EdgeInsets.symmetric(vertical: 15.h), // Responsive vertical padding
                    ),
                    child: Text(
                      'Book Now',
                      style: AppTextStyles.body.copyWith(color: AppColors.onBackground), // Black text
                    ),
                  ),
                ),
                SizedBox(width: 10.w), // Responsive horizontal spacing
                Container(
                  width: 50.w, // Responsive width
                  height: 50.h, // Responsive height
                  decoration: BoxDecoration(
                    color: AppColors.primary, // Yellow button color
                    shape: BoxShape.circle, // Circular shape
                  ),
                  child: Icon(Icons.call_made, color: AppColors.onSecondary), // Black icon
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}