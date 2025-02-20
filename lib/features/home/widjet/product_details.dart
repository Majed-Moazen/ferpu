import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_text_style.dart';

class ProductDetailsHome extends StatelessWidget {
  const ProductDetailsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // إزالة لون الخلفية
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0.1,
            blurRadius: 2,
          ),
        ],
      ),
      height: 118.h,
      width: 140.w,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // الخلفية Subtract
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/images/svg/Subtract.svg',
              fit: BoxFit.fill,
            ),
          ),
          // التيشيرت
          Positioned(
            top: -18,
            left: 15,
            child: Image.asset(
              'assets/images/png/shirt.png',
              fit: BoxFit.cover,
              height: 110.h,
              width: 110.w,
            ),
          ),
          // النصوص في الأسفل
          Positioned(
            bottom: 8, // إزاحة النصوص إلى الأسفل
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Twill Soft Shirt',
                  style: AppTextStyle.f14W400252222,
                ),
                Row(
                  children: [
                    Text(
                      '92\$',
                      style: AppTextStyle.f18w700252222,
                    ),
                    const Spacer(),
                    Stack(
                      children: [
                        SvgPicture.asset(
                          'assets/images/svg/green_circle.svg',
                          height: 30,
                          width: 30,
                        ),
                        Positioned(
                          left: 7,
                          top: 7,
                          child: SvgPicture.asset(
                            'assets/images/svg/plus.svg',
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
