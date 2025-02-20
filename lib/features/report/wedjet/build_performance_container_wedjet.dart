import 'package:ferpo/core/constants/app_images.dart';
import 'package:ferpo/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_text_style.dart';

class BuildPerformanceContainerWedjet extends StatelessWidget {
  const BuildPerformanceContainerWedjet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2.r,
            blurRadius: 5.r,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.physicalPerformance,
                  style: AppTextStyle.f18w700blue,
                ),
                20.5.h.verticalSpace,
                Text(
                  'Medium',
                  style: AppTextStyle.f16W500green,
                ),
              ],
            ),
            Spacer(),
            Stack(
              children: [
                SvgPicture.asset(AppImages.progres1Svg),
                Positioned(
                  top: 25.h,
                  left: 20.w,
                  child: Text(
                    AppStrings.p53,
                    style: AppTextStyle.f20W500blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
