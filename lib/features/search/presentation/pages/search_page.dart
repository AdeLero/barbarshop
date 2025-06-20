import 'package:barbar_shop/core/utils/app_colors/app_colors.dart';
import 'package:barbar_shop/core/utils/dummy_data/shops.dart';
import 'package:barbar_shop/core/utils/textstyles/app_textstyles.dart';
import 'package:barbar_shop/features/dashboard/presentation/viewmodels/dashboard_page_change_notifier/dashboard_page_change_notifier.dart';
import 'package:barbar_shop/features/search/presentation/widgets/shop_card.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.watch(dashboardPageChangeProvider);
    final searchController = useTextEditingController();

    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        nav.setIndex(0);
                      },
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: AppColors.onSecondary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.onBackground,
                        ),
                      ),
                    ),
                    Text("Search Overview", style: AppTextStyles.heading2),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.onSecondary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.notifications_none,
                        color: AppColors.onBackground,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                // Search Bar Row
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: AppColors.onPrimary),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.onPrimary,
                          ),
                          filled: true,
                          fillColor: AppColors.onSecondary,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.r),
                            borderSide: BorderSide(color: AppColors.onSecondary),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.r),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    // Filter icon (SVG)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.onSecondary, width: 2),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: SvgPicture.asset(
                        "assets/ic_settings.svg",
                        colorFilter: ColorFilter.mode(
                          AppColors.onBackground,
                          BlendMode.srcIn,
                        ),
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text("Popular Shops", style: AppTextStyles.heading2),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          SizedBox(
            height: 0.65.sh,
            child: Swiper(
              containerHeight: 0.65.sh,
              containerWidth: 1.2.sw,
              layout: SwiperLayout.STACK,
              scrollDirection: Axis.horizontal,
              axisDirection: AxisDirection.left,
              itemWidth: 0.8.sw,
              outer: true,
              fade: 1,
              itemCount: shops.length,
              itemBuilder: (context, index) {
                final shop = shops[index];
                return ShopCard(name: shop.name, image: shop.image);
              },
            ),
          ),
        ],
      ),
    );
  }
}
