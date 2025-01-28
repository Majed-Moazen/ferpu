import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/bloc/cubit_auth.dart';
import '../../../core/bloc/super_state.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/custom_gender_widget.dart';
import '../../../core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../../core/generic_widgets/main_button.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';
import 'otp.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({required this.phone});

  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  String phone;

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Center(child: SvgPicture.asset(AppImages.logoSvg)),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                'Welcome!',
                style: AppTextStyle.f24W700Black,
              ),
            ),
            SizedBox(height: 50),
            Text('Full Name', style: AppTextStyle.f14W400grey),
            CustomTextFormField(
              svgPath: AppImages.profileSvg,
              hintText: 'Enter Your Name',
              controller: fullNameController,
              onChanged: (value) {
                context.read<CubitAuth>().validateEmailAndName(
                    email: emailAddressController.text, name: value);
              },
            ),
            SizedBox(height: 24.h),
            Text('Email', style: AppTextStyle.f14W400grey),
            CustomTextFormField(
              onChanged: (p0) {
                context.read<CubitAuth>().validateEmailAndName(
                    email: p0, name: fullNameController.text);
              },
              svgPath: AppImages.emailSvg,
              hintText: 'Enter Your Email',
              controller: emailAddressController,
            ),
            SizedBox(height: 24.h),
            Text('Gender', style: AppTextStyle.f14W400grey),
            BlocBuilder<CubitAuth, SuperState>(
              builder: (BuildContext context, SuperState state) {
                bool isMale = state is ChangedGenderState ? state.isMale : true;
                return Row(
                  children: [
                    CustomGenderWidget(
                      svgPath: 'assets/images/svg/male.svg',
                      text: 'Male',
                      onTap: () {
                        context.read<CubitAuth>().toggleGender(false);
                      },
                      isSelected: isMale,
                    ),
                    SizedBox(width: 20.w),
                    CustomGenderWidget(
                      svgPath: 'assets/images/svg/female.svg',
                      text: 'Female',
                      onTap: () {
                        context.read<CubitAuth>().toggleGender(true);
                      },
                      isSelected: !isMale,
                    ),
                  ],
                );
              },
            ),
            BlocConsumer<CubitAuth, SuperState>(
              builder: (context, state) {
                if (state is SignUpLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
                return MainButton(
                  color: context.read<CubitAuth>().isValidSignUp
                      ? AppColors.enableButton
                      : AppColors.disableButton,
                  text: AppStrings.signUp.tr(),
                  onPressed: context.read<CubitAuth>().isValidSignUp
                      ? () async {
                          String? token =
                              await FirebaseMessaging.instance.getToken();
                          context.read<CubitAuth>().signUp(
                              phone: phone.trim(),
                              email: emailAddressController.text,
                              gender: genderController.text,
                              name: fullNameController.text,
                              token: token!);
                        }
                      : null,
                );
              },
              listener: (context, state) {
                if (state is SignUpSuccessState) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => OtpScreen(phone: phone),
                    ),
                    (route) => false,
                  );
                } else if (state is DioErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMsg),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
