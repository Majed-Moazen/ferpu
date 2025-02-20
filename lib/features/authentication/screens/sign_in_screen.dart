import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/core/theme/app_colors.dart';
import 'package:ferpo/features/authentication/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/main_button.dart';
import '../../../core/theme/app_text_style.dart';
import '../bloc/cubit_auth.dart';
import '../bloc/super_state.dart';
import 'my_widget/logo_title.dart';
import 'otp.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController phoneController = TextEditingController();

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
                        title: AppStrings.enterYourPhoneNumber.tr(),
                        subTitle: ''),
                    SizedBox(height: 100.h),
                    Text(
                      AppStrings.phoneNumber.tr(),
                      style: AppTextStyle.f14W400grey,
                    ),
                    TextFormField(
                      maxLength: 9,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r),
                            borderSide: BorderSide(
                                color: AppColors.boarderText, width: 1)),
                        fillColor: Color(0xFFF3F6FB),
                        filled: true,
                        hintStyle: AppTextStyle.f14W400grey,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 8),
                              SvgPicture.asset('assets/images/svg/SY.svg'),
                              const SizedBox(width: 8),
                              Text(
                                AppStrings.s963,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                width: 1,
                                height: 20,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ),
                        hintText: AppStrings.x00000000,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        context.read<CubitAuth>().validatePhone(value);
                      },
                    ),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
            BlocConsumer<CubitAuth, SuperState>(
              builder: (BuildContext context, SuperState state) {
                if (state is LoginLoadingState) {
                  return CircularProgressIndicator();
                }
                return MainButton(
                  color: AppColors.enableButton,
                  text: context.tr(AppStrings.continuee),
                  onPressed: context.read<CubitAuth>().isValid
                      ? () {
                          context.read<CubitAuth>().user.phone =
                              phoneController.text;
                          context.read<CubitAuth>().login(phoneController.text);
                        }
                      : null,
                );
              },
              listener: (BuildContext context, SuperState state) {
                if (state is DioErrorState) {
                  context
                      .read<CubitAuth>()
                      .showToast(state.errorMsg, color: Colors.red);
                }
                if (state is GoToSignIUp) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ));
                }
                if (state is GoToOtp) {
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
