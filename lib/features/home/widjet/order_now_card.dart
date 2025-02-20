import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../geniric_wedjet/order_submit_button.dart';

class OrderNowCard extends StatelessWidget {
  const OrderNowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.brown,
      height: 150,
      child: Stack(
        children: [
          Image.asset('assets/images/png/BG.png'),
          Positioned(
              left: 10.r,
              top: 15.r,
              child:
                  SvgPicture.asset('assets/images/svg/backround_cyrcle.svg')),
          Positioned(
              top: 5.r,
              left: 20.r,
              child: SvgPicture.asset('assets/images/svg/Vector.svg')),
          Positioned(
            left: 130.r,
            top: 20.r,
            child: Container(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '50% OFF',
                    style: AppTextStyle.f20w700orange,
                  ),
                  3.h.verticalSpace,
                  Text(
                    'Experience ultimate relaxation at a fraction of the cost',
                    style: AppTextStyle.f12W400white,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 120.r,
            top: 90.r,
            child: SvgPicture.asset(
              'assets/images/svg/backround_cyrcle.svg',
              height: 15.r,
              width: 15.r,
            ),
          ),
          Positioned(
            left: 220.r,
            top: 90.r,
            child: SvgPicture.asset(
              'assets/images/svg/backround_cyrcle.svg',
              height: 10.r,
              width: 10.r,
            ),
          ),
          Positioned(
            right: 0,
            child: SvgPicture.asset(
              'assets/images/svg/backround_cyrcle.svg',
              height: 55.r,
              width: 55.r,
            ),
          ),
          Positioned(
            left: 10.r,
            top: 10.r,
            child: SvgPicture.asset(
              'assets/images/svg/backround_cyrcle.svg',
              height: 10.r,
              width: 10.r,
            ),
          ),
          Positioned(
            right: 38.r,
            top: 100.r,
            child: OrderSubmitButton(
              color: AppColors.thirdColor,
              title: 'Order Now',
              onTab: () {},
            ),
          ),
        ],
      ),
    );
  }
}
