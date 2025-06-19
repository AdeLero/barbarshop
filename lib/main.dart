import 'package:barbar_shop/core/utils/app_theme/app_theme.dart';
import 'package:barbar_shop/features/dashboard/presentation/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 720),
      builder: (context, child) {
        return MaterialApp(
          title: 'Barbar Shop',
          theme: AppTheme.dark,
          home: const LandingPage(),
        );
      },
    );
  }
}
