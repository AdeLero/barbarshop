import 'package:barbar_shop/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

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
              const GeneralHeader(title: 'Notifications'),
              SizedBox(height: 6.h),
              Text(
                'Recent alerts and booking updates.',
                style: AppTextStyles.body.copyWith(color: AppColors.onPrimary),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: _notifications.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final notification = _notifications[index];
                    return Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.onSecondary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: notification.color.withValues(alpha: 0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              notification.icon,
                              color: notification.color,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification.title,
                                  style: AppTextStyles.body.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  notification.body,
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

class _NotificationData {
  const _NotificationData({
    required this.icon,
    required this.color,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String body;
}

const _notifications = <_NotificationData>[
  _NotificationData(
    icon: Icons.calendar_month_outlined,
    color: AppColors.primary,
    title: 'Appointment confirmed',
    body: 'Your upcoming haircut has been confirmed for Friday at 11:30 AM.',
  ),
  _NotificationData(
    icon: Icons.local_offer_outlined,
    color: Colors.orange,
    title: 'New discount nearby',
    body: 'Fade House Studio has a weekend offer on beard trims.',
  ),
  _NotificationData(
    icon: Icons.star_outline_rounded,
    color: Colors.green,
    title: 'Review reminder',
    body: 'How was your last visit to Kings & Co Barbers?',
  ),
];
