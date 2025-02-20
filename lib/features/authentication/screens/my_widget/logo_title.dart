import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/theme/app_text_style.dart';

class LogoTitle extends StatelessWidget {
  LogoTitle(
      {super.key, required this.title, required this.subTitle, this.top = 50});

  final String title;
  int top;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: top.h,
        ),
        Center(
            child: SvgPicture.asset(
          AppImages.logoSvg,
          width: 92.w,
          height: 66.h,
        )),
        SizedBox(height: 24.r),
        Center(
          child: Text(
            title,
            style: AppTextStyle.f24W700Black,
          ),
        ),
        SizedBox(
          height: 8.r,
        ),
        Center(
          child: Text(
            subTitle,
            style: AppTextStyle.f14W400grey,
          ),
        ),
      ],
    );
  }
}
