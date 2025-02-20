import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_text_style.dart';

class GridViewRate extends StatelessWidget {
  const GridViewRate(
      {super.key,
      this.title3 = '',
      required this.title1,
      required this.title2,
      required this.svgPath});
  final String title1;
  final String title2;
  final String title3;
  final String svgPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171.h,
      height: 120.h,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title1,
            style: AppTextStyle.f18W600Blue,
          ),
          24.h.verticalSpace,
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                SvgPicture.asset(svgPath),
                8.w.horizontalSpace,
                Text(
                  title2,
                  style: AppTextStyle.f18W500Grey,
                ),
                SizedBox(width: 4.w),
                Text(
                  title3,
                  style: AppTextStyle.f14W400grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
