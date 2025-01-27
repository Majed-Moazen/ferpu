import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/core/generic_widgets/custom_gender_widjet.dart';
import 'package:ferpo/home/pages/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/arrow_back_widget.dart';
import '../../core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_style.dart';
import '../bloc/cubit_auth.dart';
import '../bloc/super_state.dart';
import 'otp.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: ArrowBackWidget(),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 24.0, left: 24, right: 24, top: 64),
        child: SingleChildScrollView(
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
                svgPsth: AppImages.profileSvg,
                hintText: 'Enter Your Name',
                controller: fullNameController,
              ),
              SizedBox(height: 24.h),
              Text('Email', style: AppTextStyle.f14W400grey),
              CustomTextFormField(
                svgPsth: AppImages.emailSvg,
                hintText: 'Enter Your Email',
                controller: phoneController,
              ),
              SizedBox(height: 24.h),
              Text('Gender', style: AppTextStyle.f14W400grey),
              BlocBuilder<CubitAuth, SuperState>(
                builder: (BuildContext context, SuperState state) {
                  return BlocBuilder<CubitAuth, SuperState>(
                    builder: (BuildContext context, SuperState state) {
                      bool isMale =
                          state is ChangedGenderState ? state.isMale : true;
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
                  );
                },
              ),
              SizedBox(height: 150.h),
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
                    color: ((state is ChangedEnableButtonState)
                            ? state.isEnable
                            : false)
                        ? AppColors.enableButton
                        : AppColors.disableButton,
                    text: AppStrings.signUp.tr(),
                    onPressed: () async {
                      String? token =
                          await FirebaseMessaging.instance.getToken();
                      context.read<CubitAuth>().signUp(
                          phone: phoneController.text.trim(),
                          email: emailAddressController.text,
                          gender: genderController.text,
                          name: fullNameController.text,
                          token: token!);
                    },
                  );
                },
                listener: (context, state) {
                  if (state is SignUpSuccessState) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>
                            OtpScreen(phone: phoneController.text),
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
      ),
    );
  }
}
