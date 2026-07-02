import 'package:barbar_shop/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneralHeader extends StatelessWidget {
  const GeneralHeader({super.key, this.title, this.suffix, this.onBack});

  final String? title;
  final Widget? suffix;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onBack ?? getIt<NavigationService>().pop,
          splashColor: Colors.transparent,
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        Expanded(
          child: Center(
            child:
                title == null
                    ? const SizedBox.shrink()
                    : Text(
                      title!,
                      style: AppTextStyles.heading2,
                      textAlign: TextAlign.center,
                    ),
          ),
        ),
        SizedBox(
          width: 48.w,
          child: Align(
            alignment: Alignment.centerRight,
            child: suffix ?? const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }
}
