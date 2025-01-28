import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/generic_widgets/chose_age_generic/bloc/chose_age_cubit.dart';
import '../../../core/generic_widgets/chose_age_generic/bloc/chose_age_state.dart';
import '../../../core/generic_widgets/chose_age_generic/custom_chose_age.dart';
import '../../../core/generic_widgets/main_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class YourAge extends StatelessWidget {
  const YourAge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AgeCubit(),
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
                  'Tell us your age?',
                  style: AppTextStyle.f24W700Black,
                ),
              ),
              SizedBox(height: 8.h),
              Center(
                child: SizedBox(
                  width: 280.w,
                  child: Text(
                    'Telling your age will allow us understand your metabolism',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.f14W400grey,
                  ),
                ),
              ),
              SizedBox(height: 44.5.h),
              BlocBuilder<AgeCubit, AgeState>(
                builder: (context, state) {
                  final selectedIndex =
                      state is AgeUpdatedState ? state.selectedIndex : null;

                  return Column(
                    children: [
                      CustomChoseAge(
                        title: '18 - 24',
                        description: 'I’m young adults',
                        isSelected: selectedIndex == 0,
                        onTap: () => context.read<AgeCubit>().selectAge(0),
                        pngPath: AppImages.childPng,
                      ),
                      SizedBox(height: 16.h),
                      CustomChoseAge(
                        pngPath: AppImages.manPng,
                        title: '24 - 45',
                        description: 'I’m middle age adults',
                        isSelected: selectedIndex == 1,
                        onTap: () => context.read<AgeCubit>().selectAge(1),
                      ),
                      SizedBox(height: 16.h),
                      CustomChoseAge(
                        pngPath: AppImages.msnPng,
                        title: '45 above',
                        description: 'I’m old adults',
                        isSelected: selectedIndex == 2,
                        onTap: () => context.read<AgeCubit>().selectAge(2),
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              BlocBuilder<AgeCubit, AgeState>(
                builder: (context, state) {
                  final bool isAgeSelected =
                      state is AgeUpdatedState && state.isAgeSelected;

                  return MainButton(
                    color:
                        isAgeSelected ? AppColors.secondaryColor : Colors.grey,
                    text: 'Continue',
                    onPressed: isAgeSelected
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const YourAge(),
                              ),
                            );
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
