import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../core/bloc/on_boarding_cubit.dart';
import 'generic_widjet/CostomButtonOnBoarding.dart';
import 'generic_widjet/CustomDotController.dart';
import 'generic_widjet/CustomSliderOnboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingCubit(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: CustomSliderOnboarding(),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotController(),
                  const Spacer(),
                  CustomButtonOnBoarding(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
