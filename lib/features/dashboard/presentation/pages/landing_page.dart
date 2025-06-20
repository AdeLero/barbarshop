// landing_page.dart
import 'package:barbar_shop/features/dashboard/presentation/viewmodels/dashboard_page_change_notifier/dashboard_page_change_notifier.dart';
import 'package:barbar_shop/features/home/presentation/pages/home_page.dart';
import 'package:barbar_shop/features/search/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:barbar_shop/core/utils/app_colors/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  static const _icons = [
    Icons.home_rounded,
    Icons.search_rounded,
    Icons.calendar_today_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.watch(dashboardPageChangeProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      extendBody: true,
      body: PageView(
        controller: nav.pageController,
        onPageChanged: ref.read(dashboardPageChangeProvider).onPageChanged,
        physics: NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          SearchPage(),
          Center(child: Text("Calendar", style: TextStyle(color: Colors.white))),
          Center(child: Text("Profile", style: TextStyle(color: Colors.white))),
        ],
      ),
      bottomNavigationBar: nav.selectedPage != 1
          ? Padding(
        padding: EdgeInsets.only(left: 46.w, right: 46.w, bottom: 24.h),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(32.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_icons.length, (index) {
              final isSelected = nav.selectedPage == index;

              return GestureDetector(
                onTap: () => ref.read(dashboardPageChangeProvider).setIndex(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOutCirc,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.onSecondary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _icons[index],
                    color: isSelected ? Colors.black : Colors.white,
                    size: 24,
                  ),
                ),
              );
            }),
          ),
        ),
      )
      : null,
    );
  }
}
