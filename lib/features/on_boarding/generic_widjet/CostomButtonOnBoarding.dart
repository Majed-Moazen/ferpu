import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/on_boarding_cubit.dart';
import '../../../core/theme/app_colors.dart';

class CustomButtonOnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 4),
        textColor: Colors.white,
        onPressed: () => cubit.nextPage(context),
        color: AppColors.primaryColor,
        child: const Text("Next"),
      ),
    );
  }
}
