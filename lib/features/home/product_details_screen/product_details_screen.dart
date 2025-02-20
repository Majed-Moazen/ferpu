import 'package:ferpo/core/generic_widgets/arrow_back_widget.dart';
import 'package:ferpo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_text_style.dart';
import '../../cart/my_cart.dart';
import '../geniric_wedjet/order_submit_button.dart';
import 'bloc/product_details_cubit_screen.dart';
import 'bloc/product_details_screen_state.dart';
import 'geniric_widjet/chose_size.dart';
import 'geniric_widjet/description_dot.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductDetailsCubitScreen>();
    return Scaffold(
      body: Column(
        children: [
          BlocBuilder<ProductDetailsCubitScreen, ProductDetailsScreenState>(
            builder: (context, state) {
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60.r),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 360.h,
                  child: PageView(
                    controller: cubit.pageController,
                    onPageChanged: cubit.onPageChanged,
                    children: cubit.selectedImages
                        .map(
                          (image) => Image.asset(
                            image,
                            fit: BoxFit.cover,
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            },
          ),
          5.h.verticalSpace,
          BlocBuilder<ProductDetailsCubitScreen, ProductDetailsScreenState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    cubit.currentPage == 0
                        ? 'assets/images/svg/full_dot.svg'
                        : 'assets/images/svg/empty_dot.svg',
                    height: 10.h,
                    width: 10.w,
                  ),
                  10.w.horizontalSpace,
                  SvgPicture.asset(
                    cubit.currentPage == 1
                        ? 'assets/images/svg/full_dot.svg'
                        : 'assets/images/svg/empty_dot.svg',
                    height: 10.h,
                    width: 10.w,
                  ),
                ],
              );
            },
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'CalmShirt',
                        style: AppTextStyle.f18w700black,
                      ),
                      Spacer(),
                      SvgPicture.asset('assets/images/svg/Star 1.svg'),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text('(4.8)'),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    width: 350.w,
                    child: Text(
                      'A smart shirt made to help you feel calm and comfortable every day.',
                      style: AppTextStyle.f14W400Subtitle,
                    ),
                  ),
                  20.h.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Size:',
                        style: AppTextStyle.f14W500black,
                      ),
                      6.w.horizontalSpace,
                      ChoseSize(
                        text: 'X-Small',
                      ),
                      14.w.horizontalSpace,
                      ChoseSize(
                        text: 'Small',
                      ),
                      14.w.horizontalSpace,
                      ChoseSize(
                        text: 'Medium',
                      ),
                      14.w.horizontalSpace,
                      ChoseSize(
                        text: 'Large',
                      ),
                      14.w.horizontalSpace,
                      ChoseSize(
                        text: 'X-Large',
                      ),
                    ],
                  ),
                  20.h.verticalSpace,
                  Row(
                    children: [
                      Text('Available Colors:',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          )),
                      6.w.horizontalSpace,
                      GestureDetector(
                        onTap: () => cubit.changeColor('blue'),
                        child: SvgPicture.asset(
                            'assets/images/svg/blue_color.svg'),
                      ),
                      14.w.horizontalSpace,
                      GestureDetector(
                        onTap: () => cubit.changeColor('white'),
                        child: SvgPicture.asset(
                            'assets/images/svg/white_color.svg'),
                      ),
                      14.w.horizontalSpace,
                      GestureDetector(
                        onTap: () => cubit.changeColor('green'),
                        child: SvgPicture.asset(
                            'assets/images/svg/green_color.svg'),
                      ),
                    ],
                  ),
                  20.h.verticalSpace,
                  Text(
                    'Description',
                    style: AppTextStyle.f14W500black,
                  ),
                  Container(
                    width: 350.w,
                    child: Text(
                      'Feel calm with CalmShirt, a smart shirt designed to make your day easier and more relaxed. It helps reduce stress, tracks your stress levels, and keeps you cool with breathable fabric.',
                      style: AppTextStyle.f12W400Subtitle,
                    ),
                  ),
                  30.h.verticalSpace,
                  Column(
                    children: [
                      DescriptionDot(
                        title: 'Stress reduction: Helps you relax naturally.',
                      ),
                      1.h.verticalSpace,
                      DescriptionDot(
                        title: 'Breathable fabric: Keeps you cool all day.',
                      ),
                      1.h.verticalSpace,
                      DescriptionDot(
                        title:
                            'Temperature control: Adjusts to the weather to keep you comfy.',
                      ),
                      1.h.verticalSpace,
                      DescriptionDot(
                        title: 'Machine washable: Easy to clean and care for.',
                      ),
                      1.h.verticalSpace,
                      DescriptionDot(
                        title: 'Real-time tracking: Checks your stress levels.',
                      ),
                      15.h.verticalSpace,
                      Row(
                        children: [
                          Text(
                            '590\$',
                            style: AppTextStyle.f20W700black,
                          ),
                          Spacer(),
                          OrderSubmitButton(
                            color: AppColors.secondaryColor,
                            title: 'Add To Card',
                            onTab: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyCart()));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
