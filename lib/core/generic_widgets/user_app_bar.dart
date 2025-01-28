import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_images.dart';
import '../theme/app_colors.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(80.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsetsDirectional.only(start: 16.r, bottom: 4.r, top: 4.r),
        child: CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          child: Image.asset(
            AppImages.avatar,
            height: 64.h,
            width: 64.w,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: TextStyle(
              color: AppColors.titleGray,
              fontSize: 12.sp,
            ),
          ),
          Text(
            'User Name',
            style: TextStyle(
                color: AppColors.titleBlack,
                fontSize: 20.sp,
                fontFamily: 'cocon'),
          ),
          Text(
            'Your attire, your vitality',
            style: TextStyle(
              color: AppColors.titleGray,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(8.sp),
          child: SvgPicture.asset(
            AppImages.homeActive,
            width: 24.w,
            height: 24.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.sp),
          child: SvgPicture.asset(
            AppImages.homeActive,
            width: 24.w,
            height: 24.h,
          ),
        ),
        SizedBox(width: 8.sp),
      ],
    );
  }
}
