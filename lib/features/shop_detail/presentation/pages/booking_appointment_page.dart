import 'package:barbar_shop/core/core.dart';
import 'package:barbar_shop/features/home/domain/entities/barber_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingAppointmentPage extends StatefulWidget {
  const BookingAppointmentPage({super.key, required this.shop});

  final BarberShop shop;

  @override
  State<BookingAppointmentPage> createState() => _BookingAppointmentPageState();
}

class _BookingAppointmentPageState extends State<BookingAppointmentPage> {
  int _selectedService = 0;
  int _selectedDate = 1;
  int _selectedTime = 2;
  int _selectedBarber = 0;

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
              const GeneralHeader(title: 'Book Appointment'),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    Text(
                      widget.shop.name,
                      style: AppTextStyles.heading2.copyWith(fontSize: 22.sp),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      widget.shop.address,
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.onPrimary,
                      ),
                    ),
                    SizedBox(height: 18.h),
                    _SectionTitle(title: 'Choose service'),
                    SizedBox(height: 12.h),
                    ..._bookingServices.asMap().entries.map((entry) {
                      final index = entry.key;
                      final service = entry.value;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: _SelectableCard(
                          selected: _selectedService == index,
                          onTap: () => setState(() => _selectedService = index),
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
                      );
                    }),
                    SizedBox(height: 8.h),
                    _SectionTitle(title: 'Select barber'),
                    SizedBox(height: 12.h),
                    Row(
                      children:
                          _barbers.asMap().entries.map((entry) {
                            final index = entry.key;
                            final barber = entry.value;
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right:
                                      index == _barbers.length - 1 ? 0 : 12.w,
                                ),
                                child: _SelectableCard(
                                  selected: _selectedBarber == index,
                                  onTap:
                                      () => setState(
                                        () => _selectedBarber = index,
                                      ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 22.w,
                                        backgroundColor: AppColors.primary,
                                        child: Text(
                                          barber.initials,
                                          style: AppTextStyles.body.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        barber.name,
                                        style: AppTextStyles.body.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        barber.role,
                                        style: AppTextStyles.body.copyWith(
                                          color: AppColors.onPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 20.h),
                    _SectionTitle(title: 'Pick date'),
                    SizedBox(height: 12.h),
                    SizedBox(
                      height: 100.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _dates.length,
                        separatorBuilder: (_, __) => SizedBox(width: 12.w),
                        itemBuilder: (context, index) {
                          final date = _dates[index];
                          return _SelectableCard(
                            width: 78.w,
                            selected: _selectedDate == index,
                            onTap: () => setState(() => _selectedDate = index),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  date.day,
                                  style: AppTextStyles.heading2.copyWith(
                                    fontSize: 22.sp,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  date.label,
                                  style: AppTextStyles.body.copyWith(
                                    color: AppColors.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20.h),
                    _SectionTitle(title: 'Pick time'),
                    SizedBox(height: 12.h),
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: List.generate(_timeSlots.length, (index) {
                        final slot = _timeSlots[index];
                        final selected = _selectedTime == index;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedTime = index),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  selected
                                      ? AppColors.primary
                                      : AppColors.onSecondary,
                              borderRadius: BorderRadius.circular(18.r),
                            ),
                            child: Text(
                              slot,
                              style: AppTextStyles.body.copyWith(
                                color: selected ? Colors.black : Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColors.onSecondary,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Booking summary',
                            style: AppTextStyles.heading2,
                          ),
                          SizedBox(height: 12.h),
                          _SummaryRow(
                            label: 'Service',
                            value: _bookingServices[_selectedService].title,
                          ),
                          SizedBox(height: 10.h),
                          _SummaryRow(
                            label: 'Barber',
                            value: _barbers[_selectedBarber].name,
                          ),
                          SizedBox(height: 10.h),
                          _SummaryRow(
                            label: 'Date',
                            value: _dates[_selectedDate].fullDate,
                          ),
                          SizedBox(height: 10.h),
                          _SummaryRow(
                            label: 'Time',
                            value: _timeSlots[_selectedTime],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
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
                          'Confirm Booking',
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyles.heading2);
  }
}

class _SelectableCard extends StatelessWidget {
  const _SelectableCard({
    required this.selected,
    required this.onTap,
    required this.child,
    this.width,
  });

  final bool selected;
  final VoidCallback onTap;
  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.onSecondary,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.onSecondary,
          ),
        ),
        child: DefaultTextStyle.merge(
          style: TextStyle(color: selected ? Colors.black : Colors.white),
          child: child,
        ),
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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

class _BookingServiceData {
  const _BookingServiceData({
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

class _BarberData {
  const _BarberData({
    required this.initials,
    required this.name,
    required this.role,
  });

  final String initials;
  final String name;
  final String role;
}

class _DateData {
  const _DateData({
    required this.day,
    required this.label,
    required this.fullDate,
  });

  final String day;
  final String label;
  final String fullDate;
}

const _bookingServices = <_BookingServiceData>[
  _BookingServiceData(
    icon: Icons.content_cut_rounded,
    title: 'Classic haircut',
    subtitle: 'Trim and shape up',
    price: '\$24',
  ),
  _BookingServiceData(
    icon: Icons.face_retouching_natural_rounded,
    title: 'Beard sculpting',
    subtitle: 'Sharp beard finish',
    price: '\$18',
  ),
  _BookingServiceData(
    icon: Icons.auto_awesome_rounded,
    title: 'Premium package',
    subtitle: 'Haircut + beard + hot towel',
    price: '\$38',
  ),
];

const _barbers = <_BarberData>[
  _BarberData(initials: 'IC', name: 'Idris Coleman', role: 'Senior barber'),
  _BarberData(initials: 'AO', name: 'Ade Oladipo', role: 'Fade specialist'),
];

const _dates = <_DateData>[
  _DateData(day: '12', label: 'Fri', fullDate: 'Fri, 12 Jul'),
  _DateData(day: '13', label: 'Sat', fullDate: 'Sat, 13 Jul'),
  _DateData(day: '14', label: 'Sun', fullDate: 'Sun, 14 Jul'),
  _DateData(day: '15', label: 'Mon', fullDate: 'Mon, 15 Jul'),
];

const _timeSlots = <String>[
  '09:00 AM',
  '10:30 AM',
  '12:00 PM',
  '02:30 PM',
  '04:00 PM',
];
