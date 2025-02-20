import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/custom_gender_widget.dart';
import '../../../core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../../core/generic_widgets/main_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import '../bloc/cubit_auth.dart';
import '../bloc/super_state.dart';
import 'goal.dart';
import 'my_widget/logo_title.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen();

  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  bool isFemale = false;
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
        padding: EdgeInsets.only(right: 16.r, bottom: 16.r, left: 16.r),
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
                        title: 'Enter your Full name',
                        subTitle:
                            'Enter code sent via SMS to ${context.read<CubitAuth>().user.phone}'),
                    SizedBox(height: 32.h),
                    Text('Full Name', style: AppTextStyle.f14W400grey),
                    CustomTextFormField(
                      svgPath: AppImages.profileSvg,
                      hintText: 'Enter Your Name',
                      controller: fullNameController,
                      onChanged: (value) {
                        context.read<CubitAuth>().validateName(name: value);
                      },
                    ),
                    SizedBox(height: 24.h),
                    Text('Email', style: AppTextStyle.f14W400grey),
                    CustomTextFormField(
                      onChanged: (p0) {},
                      svgPath: AppImages.emailSvg,
                      hintText: 'Enter Your Email',
                      controller: emailAddressController,
                    ),
                    SizedBox(height: 24.h),
                    Text('Gender', style: AppTextStyle.f14W400black),
                    BlocBuilder<CubitAuth, SuperState>(
                      buildWhen: (previous, current) =>
                          current is ChangedGenderState,
                      builder: (BuildContext context, SuperState state) {
                        isFemale =
                            state is ChangedGenderState ? state.isMale : true;
                        return Row(
                          children: [
                            CustomGenderWidget(
                              svgPath: 'assets/images/svg/male.svg',
                              text: 'Male',
                              onTap: () {
                                context.read<CubitAuth>().toggleGender(false);
                              },
                              isSelected: isFemale,
                            ),
                            SizedBox(width: 20.w),
                            CustomGenderWidget(
                              svgPath: 'assets/images/svg/female.svg',
                              text: 'Female',
                              onTap: () {
                                context.read<CubitAuth>().toggleGender(true);
                              },
                              isSelected: !isFemale,
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<CubitAuth, SuperState>(
              builder: (context, state) {
                return MainButton(
                  color: AppColors.enableButton,
                  text: AppStrings.continuee.tr(),
                  onPressed: context.read<CubitAuth>().isValidSignUp
                      ? () async {
                          context.read<CubitAuth>().user.name =
                              fullNameController.text;
                          context.read<CubitAuth>().user.email =
                              emailAddressController.text;
                          context.read<CubitAuth>().user.gender =
                              isFemale ? 'Female' : 'Male';

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoalScreen(),
                              ));
                        }
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
