import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:ferpo/core/theme/app_text_style.dart';
import 'package:ferpo/features/home/product_details_screen/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/theme/app_colors.dart';
import '../widjet/daily_report.dart';
import '../geniric_wedjet/drop_down_home/pages/drop_down_menu.dart';
import '../widjet/order_now_card.dart';
import '../widjet/product_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1,
        leading: Padding(
          padding:
              EdgeInsetsDirectional.only(start: 16.r, bottom: 4.r, top: 4.r),
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
            child: Container(
              height: 40,
              width: 40,
              child: SvgPicture.asset(
                fit: BoxFit.fill,
                AppImages.notificationRed,
                width: 24.w,
                height: 24.h,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: SvgPicture.asset(
              AppImages.bagRed,
              width: 24.w,
              height: 24.h,
            ),
          ),
          SizedBox(width: 8.sp),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Home(),
              DropDownMenu(),
              32.h.verticalSpace,
              Text(
                'Our Products',
                style: AppTextStyle.f24W500ooo,
              ),
              32.h.verticalSpace,
              SizedBox(
                height: 140.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetailsScreen()));
                          },
                          child: ProductDetailsHome())),
                ),
              ),
              32.verticalSpace,
              OrderNowCard(),
              32.verticalSpace,
              Text(
                'Your Daily Report',
                style: AppTextStyle.f24W500ooo,
              ),
              15.verticalSpace,
              DailyReport(),
              32.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
