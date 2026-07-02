import 'package:barbar_shop/core/core.dart';
import 'package:barbar_shop/core/utils/dummy_data/shops.dart';
import 'package:barbar_shop/features/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GeneralHeader(title: 'Favorite Shops'),
              SizedBox(height: 6.h),
              Text(
                'Your saved barbershops and preferred spots.',
                style: AppTextStyles.body.copyWith(color: AppColors.onPrimary),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: shops.length,
                  separatorBuilder: (_, __) => SizedBox(height: 14.h),
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
            ],
          ),
        ),
      ),
    );
  }
}
