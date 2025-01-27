import 'package:ferpo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/app_text_style.dart';

class CustomGoalCardWidget extends StatelessWidget {
  const CustomGoalCardWidget({
    super.key,
    required this.svgPath,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  final String svgPath;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90.h,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? Color(0xFF0005B0) : Colors.grey,
          ),
          color: const Color(0xFFF0F4FD),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.f16W6001A1A1A,
                  ),
                  SizedBox(height: 9.h),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.f14W400grey,
                  ),
                ],
              ),
              const Spacer(),
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.all(4),
                child: SvgPicture.asset(
                  svgPath,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
