import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/home/pages/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/arrow_back_widget.dart';
import '../../core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_style.dart';
import '../bloc/cubit_abstract.dart';
import '../bloc/cubit_auth.dart';
import '../bloc/super_state.dart';
import 'otp.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController genderController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  CubitAbstract cubitAbstract = CubitAbstract();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 24.0, left: 24, right: 24, top: 64),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArrowBackWidget(),
              SizedBox(
                height: 20,
              ),
              Text(
                AppStrings.createAccount,
                style: AppTextStyle.f32W700Black,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: AppStrings.phoneNumber.tr(),
                controller: phoneController,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: AppStrings.emailAddress.tr(),
                controller: emailAddressController,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: AppStrings.fullName.tr(),
                isPassword: false,
                controller: fullNameController,
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                hintText: AppStrings.gender,
                isPassword: false,
                controller: genderController,
              ),
              SizedBox(
                height: 16,
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
                listener: (BuildContext context, SuperState state) {
                  if (state is SignUpSuccessState) {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>
                            OtpScreen(phone: phoneController.text),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  } else if (state is DioErrorState) {
                    cubitAbstract.showToast(state.errorMsg, color: Colors.red);
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
