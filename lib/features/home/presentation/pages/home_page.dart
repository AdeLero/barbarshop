import 'package:barbar_shop/core/theme/app_colors.dart';
import 'package:barbar_shop/core/theme/app_textstyles.dart';
import 'package:barbar_shop/core/utils/dummy_data/shops.dart';
import 'package:barbar_shop/features/home/presentation/widgets/barber_shop_card.dart';
import 'package:barbar_shop/features/profile/presentation/widgets/widgets.dart';
import 'package:barbar_shop/features/shop_detail/presentation/pages/shop_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          width: 4.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        SizedBox(width: 24.w),
                        Flexible(
                          child: Text(
                            """Find \nYour Style!""",
                            style: AppTextStyles.heading1,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 24.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.onSecondary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(24.r),
                    ),
                    child: Icon(
                      Icons.notifications_none,
                      color: AppColors.onBackground,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: AppColors.onPrimary),
                  prefixIcon: Icon(Icons.search, color: AppColors.onPrimary),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide(color: AppColors.onSecondary),
                  ),
                  focusColor: AppColors.primary,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.r),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upcoming Appointment", style: AppTextStyles.heading2),
                  Text("See all", style: AppTextStyles.body),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18.w),
                decoration: BoxDecoration(
                  color: AppColors.onSecondary,
                  borderRadius: BorderRadius.circular(28.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            "Confirmed",
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "2.4 km away",
                          style: AppTextStyles.body.copyWith(
                            color: AppColors.onPrimary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    Text(
                      shops.first.name,
                      style: AppTextStyles.heading2.copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Haircut + Beard Sculpting",
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.onPrimary,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.onBackground,
                        ),
                        SizedBox(width: 8.w),
                        Text("Fri, 12 Jul • 11:30 AM", style: AppTextStyles.body),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        const Icon(
                          Icons.person_outline_rounded,
                          color: AppColors.onBackground,
                        ),
                        SizedBox(width: 8.w),
                        Text("Barber: Idris Coleman", style: AppTextStyles.body),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Favorite Shops", style: AppTextStyles.heading2),
                  Text(
                    "View all",
                    style: AppTextStyles.body.copyWith(color: AppColors.primary),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 220.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shops.length,
                  itemBuilder: (context, index) {
                    final shop = shops[index];
                    return ProfileFavoriteShopCard(
                      name: shop.name,
                      distance: shop.address,
                      image: shop.image,
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nearby Barbershops", style: AppTextStyles.heading2),
                  Text("See all", style: AppTextStyles.body),
                ],
              ),
              SizedBox(height: 16.h),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: shops.length,
                itemBuilder: (context, index) {
                  final shop = shops[index];
                  return Column(
                    children: [
                      BarberShopCard(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ShopDetailPage(shop: shop,);
                              },
                            ),
                          );
                        },
                        name: shop.name,
                        distance: shop.address,
                        image: shop.image,
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                },
              ),
              SizedBox(height: 96.h),
            ],
          ),
        ),
      ),
    );
  }
}
