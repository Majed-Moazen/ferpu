import 'package:ferpo/core/generic_widgets/bottom_navigation_bar/generic_widjet/container_nav_bar.dart';
import 'package:ferpo/features/on_boarding/widjet/text_swiched_2.dart';
import 'package:ferpo/features/on_boarding/widjet/text_swiched_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc/on_boarding_cubit.dart';
import 'bloc/on_boarding_state.dart';
import 'generic_widjet/CostomButtonOnBoarding.dart';
import 'generic_widjet/custom_skip_buttom.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingCubit(),
      child: Scaffold(
        body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            final cubit = context.read<OnBoardingCubit>();

            return Stack(
              children: [
                Positioned.fill(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: Image.asset(
                      cubit.getBackgroundImage(),
                      key: ValueKey(cubit.currentPage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                PageView.builder(
                  controller: cubit.pageController,
                  onPageChanged: cubit.onPageChanged,
                  itemCount: cubit.backgroundImages.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        if (cubit.currentPage == 1)
                          Positioned(
                            top: 210,
                            left: 80,
                            child: OnBoardingImageSwitcher2(),
                          ),
                        if (cubit.currentPage == 2)
                          Positioned(
                            top: 120,
                            left: 80,
                            child: OnBoardingImageSwitcher3(pageIndex: 2),
                          ),
                      ],
                    );
                  },
                ),
                Positioned(
                  top: 60.h,
                  right: 20.w,
                  child: CustomSkipButtom(),
                ),
                Positioned(
                  bottom: 30.h,
                  left: 20,
                  right: 20,
                  child: CustomButtonOnBoarding(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
