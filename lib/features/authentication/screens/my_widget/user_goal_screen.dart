import 'package:ferpo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/generic_widgets/chose_goal_generic/bloc/goal_cubit.dart';
import '../../../../core/generic_widgets/chose_goal_generic/bloc/goal_state.dart';
import '../../../../core/generic_widgets/chose_goal_generic/custom_goal_card_widjet.dart';
import '../../../../core/generic_widgets/main_button.dart';
import '../../../../core/theme/app_text_style.dart';
import '../your_age.dart';

class UserGoalScreen extends StatelessWidget {
  const UserGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoalCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 28.h),
              Center(child: SvgPicture.asset(AppImages.logoSvg)),
              SizedBox(height: 24.h),
              Center(
                child: Text(
                  'What is your goals?',
                  style: AppTextStyle.f24W700Black,
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: SizedBox(
                  width: 280.w,
                  child: Text(
                    'Let’s define your goals and will help you to achieve it ',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.f14W400grey,
                  ),
                ),
              ),
              SizedBox(height: 44.5.h),
              BlocBuilder<GoalCubit, GoalState>(
                builder: (context, state) {
                  if (state is GoalUpdatedState) {
                    return Column(
                      children: [
                        CustomGoalCardWidget(
                          svgPath: AppImages.fireSvg,
                          title: 'Loss Weight',
                          description: 'Burn calories & get ideal body',
                          isSelected: state.selectedGoals[0],
                          onTap: () => context.read<GoalCubit>().toggleGoal(0),
                        ),
                        SizedBox(height: 16.h),
                        CustomGoalCardWidget(
                          svgPath: AppImages.dambleSvg,
                          title: 'Gain Muscle',
                          description: 'Build mass and power',
                          isSelected: state.selectedGoals[1],
                          onTap: () => context.read<GoalCubit>().toggleGoal(1),
                        ),
                        SizedBox(height: 16.h),
                        CustomGoalCardWidget(
                          svgPath: AppImages.relaxSvg,
                          title: 'Get Better',
                          description: 'Healthier than ever',
                          isSelected: state.selectedGoals[2],
                          onTap: () => context.read<GoalCubit>().toggleGoal(2),
                        ),
                      ],
                    );
                  }

                  return Center(
                      child:
                          CircularProgressIndicator()); // حالة انتظار بدلاً من حاوية فارغة
                },
              ),
              const Spacer(),
              BlocBuilder<GoalCubit, GoalState>(
                builder: (context, state) {
                  final bool isAnyGoalSelected = state is GoalUpdatedState
                      ? state.isAnyGoalSelected
                      : false;

                  return MainButton(
                    color: isAnyGoalSelected
                        ? AppColors.secondaryColor
                        : Colors.grey,
                    text: 'Continue',
                    onPressed: isAnyGoalSelected
                        ? () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => YourAge()));
                          }
                        : () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
