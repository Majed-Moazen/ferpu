import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/chose_age_generic/custom_chose_age.dart';
import '../../../core/generic_widgets/main_button.dart';
import '../../../core/theme/app_colors.dart';
import '../bloc/cubit_auth.dart';
import '../bloc/super_state.dart';
import 'my_widget/logo_title.dart';
import 'otp.dart';

class AgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LogoTitle(
                        top: 10,
                        title: 'Tell us your age?',
                        subTitle:
                            'Telling your age will allow us understand your metabolism'),
                    SizedBox(height: 44.5.h),
                    BlocBuilder<CubitAuth, SuperState>(
                      buildWhen: (previous, current) =>
                          current is AgeUpdatedState,
                      builder: (context, state) {
                        final selectedIndex;
                        if (state is AgeUpdatedState) {
                          selectedIndex = state.selectedIndex;
                        } else {
                          selectedIndex = null;
                        }
                        return Column(
                          children: [
                            CustomChoseAge(
                              title: '18 - 24',
                              description: 'I’m young adults',
                              isSelected: selectedIndex == 0,
                              onTap: () =>
                                  context.read<CubitAuth>().selectAge(0),
                              pngPath: AppImages.childPng,
                            ),
                            SizedBox(height: 16.h),
                            CustomChoseAge(
                              pngPath: AppImages.manPng,
                              title: '24 - 45',
                              description: 'I’m middle age adults',
                              isSelected: selectedIndex == 1,
                              onTap: () =>
                                  context.read<CubitAuth>().selectAge(1),
                            ),
                            SizedBox(height: 16.h),
                            CustomChoseAge(
                              pngPath: AppImages.msnPng,
                              title: '45 above',
                              description: 'I’m old adults',
                              isSelected: selectedIndex == 2,
                              onTap: () =>
                                  context.read<CubitAuth>().selectAge(2),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<CubitAuth, SuperState>(
              buildWhen: (previous, current) =>
                  current is SignUpLoadingState ||
                  current is SignUpSuccessState ||
                  current is SignUpErrorState,
              builder: (BuildContext context, SuperState state) {
                if (state is SignUpLoadingState) {
                  return CircularProgressIndicator();
                } else
                  return MainButton(
                    color: AppColors.enableButton,
                    text: AppStrings.continuee.tr(),
                    onPressed: () async {
                      String? token =
                          await FirebaseMessaging.instance.getToken();
                      context.read<CubitAuth>().signUp(
                          age_ragne:
                              context.read<CubitAuth>().user.ageRange ?? 0,
                          goal: context.read<CubitAuth>().user.goal,
                          phone: context.read<CubitAuth>().user.phone.trim(),
                          email: context.read<CubitAuth>().user.email ?? '',
                          gender: context.read<CubitAuth>().user.gender,
                          name: context.read<CubitAuth>().user.name,
                          token: token ?? '');
                    },
                  );
              },
              listener: (BuildContext context, SuperState state) {
                if (state is SignUpErrorState) {
                  context
                      .read<CubitAuth>()
                      .showToast(state.errorMsg, color: Colors.red);
                }
                if (state is SignUpSuccessState) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(),
                      ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
