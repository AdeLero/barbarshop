import 'package:barbar_shop/core/theme/app_colors.dart';
import 'package:barbar_shop/core/theme/app_textstyles.dart';

import 'package:barbar_shop/features/profile/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 48.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Profile', style: AppTextStyles.heading2),
                  Text(
                    'Edit Profile',
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ProfileCard(),
              SizedBox(height: 20.h),
              Row(
                children: const [
                  Expanded(child: ProfileStatCard(value: '12', label: 'Bookings')),
                  SizedBox(width: 12),
                  Expanded(child: ProfileStatCard(value: '05', label: 'Saved Shops')),
                  SizedBox(width: 12),
                  Expanded(child: ProfileStatCard(value: '08', label: 'Reviews')),
                ],
              ),
              Text('Account & Preferences', style: AppTextStyles.heading2),
              SizedBox(height: 12.h),
              const ProfileActionTile(
                icon: Icons.person_outline_rounded,
                title: 'Personal Details',
                subtitle: 'Update your name, phone number, and location.',
                highlight: true,
              ),
              SizedBox(height: 12.h),
              const ProfileActionTile(
                icon: Icons.notifications_none_rounded,
                title: 'Notifications',
                subtitle: 'Choose reminders for bookings and promotions.',
              ),
              SizedBox(height: 12.h),
              const ProfileActionTile(
                icon: Icons.credit_card_outlined,
                title: 'Payment Methods',
                subtitle: 'Manage cards for quick, secure checkout.',
              ),
              SizedBox(height: 12.h),
              const ProfileActionTile(
                icon: Icons.headset_mic_outlined,
                title: 'Support',
                subtitle: 'Get help with bookings, refunds, and account issues.',
              ),
              SizedBox(height: 12.h),
              const ProfileActionTile(
                icon: Icons.logout_rounded,
                title: 'Log Out',
                subtitle: 'Sign out from this device when you are done.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
