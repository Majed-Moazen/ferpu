import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../bloc/on_boarding_cubit.dart';
import '../bloc/on_boarding_state.dart';

class CustomDotController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            cubit.onBoarderList.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: cubit.currentPage == index ? 20 : 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: cubit.currentPage == index
                    ? AppColors.primaryColor
                    : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        );
      },
    );
  }
}
