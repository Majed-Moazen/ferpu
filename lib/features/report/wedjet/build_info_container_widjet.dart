import 'package:ferpo/core/constants/app_images.dart';
import 'package:ferpo/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_text_style.dart';

class BuildInfoContainerWidjet extends StatelessWidget {
  const BuildInfoContainerWidjet({super.key});

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
      child: Row(
        children: [
          Image.asset(
            AppImages.p3435,
            height: 120.h,
            width: 120.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.calmshirt,
                  style: AppTextStyle.f18w700blue,
                ),
                4.h.verticalSpace,
                SizedBox(
                  width: 200.w,
                  child: Text(
                    AppStrings.nowWearingYourSmart,
                    style: AppTextStyle.f12W500Black,
                  ),
                ),
                12.h.verticalSpace,
                Container(
                  height: 25.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  decoration: BoxDecoration(
                    color: Color(0xA1EDBAAA),
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImages.selectedStar),
                      4.w.horizontalSpace,
                      Text(
                        AppStrings.p48,
                        style: AppTextStyle.f14W600orange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
