import 'package:ferpo/core/constants/app_images.dart';
import 'package:ferpo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({super.key, required this.index, this.isSelected = false});

  int index;

  List<String> images = [
    AppImages.wu,
    AppImages.masterCard,
    AppImages.paypal,
  ];
  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            12.r,
          ),
          border: isSelected
              ? Border.all(color: AppColors.boarderGoal, width: 2)
              : null),
      child: Image.asset(
        images[index],
        width: 70.w,
        height: 32.h,
      ),
    );
  }
}
