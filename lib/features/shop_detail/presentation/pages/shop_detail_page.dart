import 'package:barbar_shop/core/core.dart';
import 'package:barbar_shop/features/home/domain/entities/barber_shop.dart';
import 'package:barbar_shop/features/shop_detail/presentation/pages/booking_appointment_page.dart';
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
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.asset(
                    shop.image,
                    height: 0.46.sh,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 0.46.sh,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.15),
                          Colors.black.withValues(alpha: 0.65),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20.h,
                    left: 16.w,
                    right: 16.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _CircularIconButton(
                          icon: Icons.arrow_back_ios_new_rounded,
                          onTap: () => getIt<NavigationService>().pop(),
                        ),
                        _CircularIconButton(
                          icon: Icons.bookmarks_outlined,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 16.w,
                    right: 16.w,
                    bottom: 16.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            'Top Rated',
                            style: AppTextStyles.body.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          shop.name,
                          style: AppTextStyles.heading2.copyWith(
                            fontSize: 24.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              shop.address,
                              style: AppTextStyles.body.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            const Icon(
                              Icons.star_rounded,
                              color: AppColors.primary,
                              size: 18,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '4.8',
                              style: AppTextStyles.body.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ShopOptionCard(
                            icon: const Icon(Icons.call_outlined),
                            label: 'Call',
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ShopOptionCard(
                            icon: const Icon(Icons.chat_outlined),
                            label: 'Message',
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ShopOptionCard(
                            icon: const Icon(Icons.directions_outlined),
                            label: 'Route',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text('About this shop', style: AppTextStyles.heading2),
                    SizedBox(height: 10.h),
                    Text(
                      'A premium barbershop experience with classic cuts, beard grooming, and a relaxed space for your next refresh.',
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.onPrimary,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.onSecondary,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Working hours', style: AppTextStyles.heading2),
                          SizedBox(height: 12.h),
                          _InfoRow(
                            icon: Icons.access_time_rounded,
                            label: 'Mon - Sat',
                            value: '09:00 AM - 08:00 PM',
                          ),
                          SizedBox(height: 10.h),
                          _InfoRow(
                            icon: Icons.calendar_month_outlined,
                            label: 'Sunday',
                            value: '10:00 AM - 04:00 PM',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),
                    Text('Popular services', style: AppTextStyles.heading2),
                    SizedBox(height: 12.h),
                    ..._services.map(
                      (service) => Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: AppColors.onSecondary,
                            borderRadius: BorderRadius.circular(22.r),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withValues(
                                    alpha: 0.12,
                                  ),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Icon(
                                  service.icon,
                                  color: AppColors.primary,
                                ),
                              ),
                              SizedBox(width: 14.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      service.title,
                                      style: AppTextStyles.body.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      service.subtitle,
                                      style: AppTextStyles.body.copyWith(
                                        color: AppColors.onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                service.price,
                                style: AppTextStyles.body.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          getIt<NavigationService>().push(
                            BookingAppointmentPage(shop: shop),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                        ),
                        child: Text(
                          'Book Appointment',
                          style: AppTextStyles.body.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CircularIconButton extends StatelessWidget {
  const _CircularIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40.r),
      child: Material(
        color: Colors.black.withValues(alpha: 0.25),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 48.w,
            width: 48.w,
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            label,
            style: AppTextStyles.body.copyWith(color: AppColors.onPrimary),
          ),
        ),
        Text(
          value,
          style: AppTextStyles.body.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _ServiceData {
  const _ServiceData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String price;
}

const _services = <_ServiceData>[
  _ServiceData(
    icon: Icons.content_cut_rounded,
    title: 'Classic haircut',
    subtitle: 'Precision trim with finish styling',
    price: '\$24',
  ),
  _ServiceData(
    icon: Icons.face_retouching_natural_rounded,
    title: 'Beard sculpting',
    subtitle: 'Shape and detail your beard line',
    price: '\$18',
  ),
  _ServiceData(
    icon: Icons.auto_awesome_rounded,
    title: 'Premium package',
    subtitle: 'Haircut, beard, and hot towel treatment',
    price: '\$38',
  ),
];
