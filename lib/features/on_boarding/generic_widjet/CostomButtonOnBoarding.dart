import 'package:ferpo/core/generic_widgets/bottom_navigation_bar/generic_widjet/container_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/on_boarding_cubit.dart';
import '../../../core/theme/app_colors.dart';
import '../bloc/on_boarding_state.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();

        return Container(
          margin: const EdgeInsets.only(bottom: 30),
          height: 56.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 4),
              textColor: Colors.white,
              onPressed: () => cubit.nextPage(context),
              color: AppColors.secondaryColor,
              child: const Text("Next"),
            ),
          ),
        );
      },
    );
  }
}
