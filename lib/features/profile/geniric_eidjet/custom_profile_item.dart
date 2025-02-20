import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_text_style.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem(
      {super.key,
      required this.leadingSvg,
      required this.trailingSvg,
      required this.text});

  final String leadingSvg;
  final String trailingSvg;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      child: Row(
        children: [
          Container(
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                leadingSvg,
                fit: BoxFit.cover,
              )),
          13.w.horizontalSpace,
          Text(
            text,
            style: AppTextStyle.f16W500xxx,
          ),
          Spacer(),
          Container(
              height: 15,
              width: 15,
              child: SvgPicture.asset(
                trailingSvg,
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
