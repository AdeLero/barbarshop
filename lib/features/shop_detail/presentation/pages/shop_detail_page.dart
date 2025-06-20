import 'dart:ui';

import 'package:barbar_shop/core/utils/app_colors/app_colors.dart';
import 'package:barbar_shop/core/utils/textstyles/app_textstyles.dart';
import 'package:barbar_shop/features/home/domain/entities/barber_shop.dart';
import 'package:barbar_shop/features/shop_detail/presentation/widgets/shop_option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ShopDetailPage extends HookConsumerWidget {
  final BarberShop shop;
  const ShopDetailPage({super.key, required this.shop});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
              ),
              child: Stack(
                children: [
                  Image.asset(shop.image, height: 0.5.sh, fit: BoxFit.cover),
                  Positioned(
                    top: 48.h,
                    left: 12.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: AppColors.onBackground.withAlpha(20),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.onBackground,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 48.h,
                    right: 12.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: AppColors.onPrimary.withOpacity(
                              0.3,
                            ), // translucent color
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 4.w),
                              Text(
                                "4.8",
                                style: AppTextStyles.body.copyWith(
                                  color: Colors.white,
                                ), // optional: make text pop
                              ),
                              SizedBox(width: 8.w),
                              CircleAvatar(
                                backgroundColor: AppColors.primary,
                                child: Icon(
                                  Icons.star,
                                  color: AppColors.background,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16.h,
                    left: 16.w,
                    right: 16.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: AppColors.onPrimary.withOpacity(
                              0.3,
                            ), // translucent color
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    shop.name,
                                    style: AppTextStyles.heading2,
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                        shop.address,
                                        style: AppTextStyles.body,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              CircleAvatar(
                                radius: 24.w,
                                backgroundColor: AppColors.onBackground
                                    .withAlpha(40),
                                child: Icon(
                                  Icons.bookmarks_outlined,
                                  color: AppColors.onBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ShopOptionCard(
                          icon: Icon(Icons.call_outlined),
                          label: "Call",
                        ),
                        SizedBox(width: 12.w),
                        ShopOptionCard(
                          icon: Icon(Icons.chat_outlined),
                          label: "Message",
                        ),
                        SizedBox(width: 12.w),
                        ShopOptionCard(
                          icon: Icon(Icons.directions),
                          label: "Directions",
                        ),
                        SizedBox(width: 12.w),
                        ShopOptionCard(
                          icon: Icon(Icons.more_horiz),
                          label: "See More",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text("Popular Shops", style: AppTextStyles.heading2),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColors.onSecondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                24.r,
                              ), // Responsive rounded corners
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 15.h,
                            ), // Responsive vertical padding
                          ),
                          child: Text(
                            "About",
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.onBackground,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.onSecondary,
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                40,
                              ), // adjust as needed
                              side: BorderSide(color: AppColors.onSecondary),
                            ),
                            side: BorderSide(
                              color: AppColors.onSecondary,
                            ), // needed separately too
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                          ),
                          child: Text(
                            "Review",
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.onBackground,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.onSecondary,
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(width: 12.w),
                            Text("Santa Barbara, California"),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Icon(Icons.calendar_month_outlined),
                            SizedBox(width: 12.w),
                            Text("Friday, June 25"),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      24.r,
                                    ), // Responsive rounded corners
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 15.h,
                                  ), // Responsive vertical padding
                                ),
                                child: Text(
                                  "Book Now",
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.background,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
