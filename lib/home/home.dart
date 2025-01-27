import 'package:ferpo/core/constants/app_images.dart';
import 'package:ferpo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage(
                    AppImages.component,
                  ),
                ),
              ),
              height: 104.h,
              width: double.infinity,
              margin: EdgeInsetsDirectional.all(16.sp),
            ),
            Positioned(
              right: 45.r,
              top: 82.r,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r)),
                color: AppColors.buttonColor,
                onPressed: () {},
                child: Text(
                  'Tell us',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
