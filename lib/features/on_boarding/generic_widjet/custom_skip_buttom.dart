import 'package:ferpo/core/generic_widgets/bottom_navigation_bar/generic_widjet/container_nav_bar.dart';
import 'package:ferpo/core/theme/app_text_style.dart';
import 'package:ferpo/features/on_boarding/bloc/on_boarding_cubit.dart';
import 'package:ferpo/features/on_boarding/bloc/on_boarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSkipButtom extends StatelessWidget {
  const CustomSkipButtom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (BuildContext context, state) {
        final cubit = context.read<OnBoardingCubit>();

        return Container(
          height: 38.h,
          width: 76.w,
          decoration: BoxDecoration(
            color: Color(0xFFF3F4F5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: GestureDetector(
              onTap: () => cubit.skipOnBoarding(context),
              child: Text(
                "Skip",
                style: AppTextStyle.f16W600blue,
              ),
            ),
          ),
        );
      },
    );
  }
}
