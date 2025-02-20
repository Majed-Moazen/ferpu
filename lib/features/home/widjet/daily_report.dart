import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_text_style.dart';

class DailyReport extends StatelessWidget {
  const DailyReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/images/svg/cyrcle.svg'),
                Positioned(
                  top: 17,
                  left: 18,
                  child: Text(
                    '50%',
                    style: AppTextStyle.f16W700blue,
                  ),
                ),
              ],
            ),
            10.w.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Stress Relief Insights',
                  style: AppTextStyle.f16W700000043,
                ),
                Text(
                  'Heart Rate Variability (HRV)',
                  style: AppTextStyle.f10W400000043,
                ),
              ],
            ),
            Spacer(),
            SvgPicture.asset('assets/images/svg/Group 10.svg'),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
