import 'package:barbar_shop/core/theme/app_colors.dart';
import 'package:barbar_shop/core/theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AppointmentTab { upcoming, past }

final appointmentTabProvider = StateProvider<AppointmentTab>((ref) {
  return AppointmentTab.upcoming;
});

class AppointmentsPage extends ConsumerWidget {
  const AppointmentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(appointmentTabProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 96.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Appointments', style: AppTextStyles.heading2),
              SizedBox(height: 6.h),
              Text(
                'Track upcoming visits and review past bookings.',
                style: AppTextStyles.body.copyWith(color: AppColors.onPrimary),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: _CustomTabButton(
                      label: 'Upcoming',
                      selected: selectedTab == AppointmentTab.upcoming,
                      onTap: () {
                        ref.read(appointmentTabProvider.notifier).state =
                            AppointmentTab.upcoming;
                      },
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _CustomTabButton(
                      label: 'Past',
                      selected: selectedTab == AppointmentTab.past,
                      onTap: () {
                        ref.read(appointmentTabProvider.notifier).state =
                            AppointmentTab.past;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Expanded(
                child:
                    selectedTab == AppointmentTab.upcoming
                        ? _AppointmentList(
                          appointments: _upcomingAppointments,
                          emptyLabel: 'No upcoming appointments.',
                        )
                        : _AppointmentList(
                          appointments: _pastAppointments,
                          emptyLabel: 'No past appointments yet.',
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTabButton extends StatelessWidget {
  const _CustomTabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.onSecondary,
          borderRadius: BorderRadius.circular(18.r),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: AppTextStyles.body.copyWith(
            color: selected ? Colors.black : Colors.white70,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _AppointmentList extends StatelessWidget {
  const _AppointmentList({
    required this.appointments,
    required this.emptyLabel,
  });

  final List<_AppointmentData> appointments;
  final String emptyLabel;

  @override
  Widget build(BuildContext context) {
    if (appointments.isEmpty) {
      return Center(child: Text(emptyLabel, style: AppTextStyles.body));
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: appointments.length,
      separatorBuilder: (_, __) => SizedBox(height: 14.h),
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(18.w),
          decoration: BoxDecoration(
            color: AppColors.onSecondary,
            borderRadius: BorderRadius.circular(24.r),
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
                      color: appointment.statusColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      appointment.status,
                      style: AppTextStyles.body.copyWith(
                        color: appointment.statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    appointment.distance,
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Text(
                appointment.shopName,
                style: AppTextStyles.heading2.copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 8.h),
              Text(
                appointment.service,
                style: AppTextStyles.body.copyWith(color: AppColors.onPrimary),
              ),
              SizedBox(height: 18.h),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: AppColors.onBackground,
                  ),
                  SizedBox(width: 8.w),
                  Text(appointment.schedule, style: AppTextStyles.body),
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
                  Text(appointment.barber, style: AppTextStyles.body),
                ],
              ),
              if (appointment.actionLabel != null) ...[
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                    child: Text(appointment.actionLabel!),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _AppointmentData {
  const _AppointmentData({
    required this.status,
    required this.statusColor,
    required this.shopName,
    required this.service,
    required this.schedule,
    required this.barber,
    required this.distance,
    this.actionLabel,
  });

  final String status;
  final Color statusColor;
  final String shopName;
  final String service;
  final String schedule;
  final String barber;
  final String distance;
  final String? actionLabel;
}

const _upcomingAppointments = <_AppointmentData>[
  _AppointmentData(
    status: 'Confirmed',
    statusColor: AppColors.primary,
    shopName: 'Kings & Co Barbers',
    service: 'Haircut + Beard Sculpting',
    schedule: 'Fri, 12 Jul • 11:30 AM',
    barber: 'Barber: Idris Coleman',
    distance: '2.4 km away',
    actionLabel: 'Reschedule',
  ),
  _AppointmentData(
    status: 'Pending',
    statusColor: Colors.orange,
    shopName: 'Fade House Studio',
    service: 'Low fade and lineup',
    schedule: 'Sat, 13 Jul • 02:00 PM',
    barber: 'Barber: Ade Oladipo',
    distance: '4.1 km away',
    actionLabel: 'View Details',
  ),
];

const _pastAppointments = <_AppointmentData>[
  _AppointmentData(
    status: 'Completed',
    statusColor: Colors.green,
    shopName: 'Kings & Co Barbers',
    service: 'Classic haircut',
    schedule: 'Mon, 01 Jul • 09:00 AM',
    barber: 'Barber: Idris Coleman',
    distance: '2.4 km away',
    actionLabel: 'Book Again',
  ),
  _AppointmentData(
    status: 'Completed',
    statusColor: Colors.green,
    shopName: 'Fade House Studio',
    service: 'Beard trim and shape up',
    schedule: 'Wed, 12 Jun • 04:30 PM',
    barber: 'Barber: Ade Oladipo',
    distance: '4.1 km away',
    actionLabel: 'Book Again',
  ),
];
