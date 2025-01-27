import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class CustomGenderWidget extends StatelessWidget {
  const CustomGenderWidget({
    Key? key,
    required this.svgPath,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String svgPath;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          height: 60.h,
          width: 134.w,
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.selectedGenderColor
                : AppColors.unSelectedGenderColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(svgPath),
              SizedBox(width: 8),
              Text(
                text,
                style: AppTextStyle.f16W500xxx,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
