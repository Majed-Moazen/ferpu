import 'package:ferpo/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../model/goal.dart';

class GoalList extends StatelessWidget {
  GoalList({required this.goalModel});
  GoalModel goalModel;

  @override
  Widget build(BuildContext context) {
    print(goalModel.isSelected);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.r, horizontal: 16.r),
      width: double.infinity,
      height: 66.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
            color: goalModel.isSelected
                ? AppColors.boarderText
                : AppColors.titleGray,
            width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                goalModel.title,
                style: AppTextStyle.f16W6001A1A1A,
              ),
              SizedBox(height: 9.h),
              Text(
                goalModel.subTitle,
                style: AppTextStyle.f12W500gray,
              ),
            ],
          ),
          SvgPicture.asset(goalModel.image),
        ],
      ),
    );
  }
}
