import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_text_style.dart';

class DescriptionDot extends StatelessWidget {
  const DescriptionDot({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/images/svg/dot.svg'),
        6.w.horizontalSpace,
        Text(
          title,
          style: AppTextStyle.f12W400Subtitle,
        ),
      ],
    );
  }
}
