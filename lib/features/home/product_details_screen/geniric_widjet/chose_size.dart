import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_text_style.dart';

class ChoseSize extends StatelessWidget {
  const ChoseSize({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: 50.w,
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.f12W400black,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: color,
      ),
    );
  }
}
