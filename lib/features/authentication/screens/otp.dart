import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/core/theme/app_text_style.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/generic_widgets/main_button.dart';
import '../../../core/theme/app_colors.dart';
import '../bloc/cubit_auth.dart';
import '../bloc/super_state.dart';
import 'my_widget/logo_title.dart';
import 'my_widget/user_goal_screen.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({
    super.key,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    context.read<CubitAuth>().timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<CubitAuth>().timeOtp(30);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LogoTitle(
                        title: 'Enter Verification Code',
                        subTitle:
                            'Enter code sent via SMS to +963 ${context.read<CubitAuth>().user.phone} '),
                    SizedBox(
                      height: 60.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.r),
                      child: Pinput(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        controller: otpController,
                        length: 4,
                        preFilledWidget: Text(
                          '-',
                          style: TextStyle(color: AppColors.titleGray),
                        ),
                        keyboardType: TextInputType.number,
                        defaultPinTheme: PinTheme(
                          width: 56.w,
                          height: 56.h,
                          textStyle: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w500),
                          decoration: BoxDecoration(
                            color: AppColors.textFieldColor,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 56.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                              color: AppColors.textFieldColor,
                              border: Border.all(
                                  width: 1, color: AppColors.boarderText),
                              borderRadius: BorderRadius.circular(16.r)),
                        ),
                        errorPinTheme: PinTheme(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.thirdColor,
                            ),
                          ),
                        ),
                        onChanged: (String value) {
                          context.read<CubitAuth>().validateOtp(value);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    BlocBuilder<CubitAuth, SuperState>(
                      buildWhen: (previous, current) =>
                          current is OtpTimerState ||
                          current is OtpTimerOutState,
                      builder: (context, state) {
                        if (state is OtpTimerState)
                          return Text(
                              'Waiting for the code ( ${state.sec} sec )');
                        else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Did not receive OTP code?'),
                              SizedBox(
                                width: 8.w,
                              ),
                              TextButton(
                                  onPressed: () async {
                                    String? token = await FirebaseMessaging
                                        .instance
                                        .getToken();
                                    context.read<CubitAuth>().signUp(
                                        age_ragne: context
                                                .read<CubitAuth>()
                                                .user
                                                .ageRange ??
                                            0,
                                        goal:
                                            context.read<CubitAuth>().user.goal,
                                        phone: context
                                            .read<CubitAuth>()
                                            .user
                                            .phone
                                            .trim(),
                                        email: context
                                                .read<CubitAuth>()
                                                .user
                                                .email ??
                                            '',
                                        gender: context
                                            .read<CubitAuth>()
                                            .user
                                            .gender,
                                        name:
                                            context.read<CubitAuth>().user.name,
                                        token: token ?? '');
                                    context.read<CubitAuth>().timeOtp(30);
                                  },
                                  child: Text(
                                    'Resend Code',
                                    style: AppTextStyle.f16W700SecondColor,
                                  ))
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<CubitAuth, SuperState>(
              builder: (BuildContext context, state) {
                if (state is OtpLoadingState) {
                  return CircularProgressIndicator();
                }
                return MainButton(
                  text: AppStrings.verify.tr(),
                  color: context.read<CubitAuth>().activeButtonOtp
                      ? AppColors.enableButton
                      : AppColors.disableButton,
                  onPressed: context.read<CubitAuth>().activeButtonOtp
                      ? () {
                          String otp = otpController.text.trim();
                          context.read<CubitAuth>().checkCode(
                              context.read<CubitAuth>().user.phone, otp);
                        }
                      : null,
                );
              },
              listener: (context, state) {
                if (state is OtpSuccessState) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => UserGoalScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                } else if (state is OtpErrorState) {
                  context
                      .read<CubitAuth>()
                      .showToast(state.errorMsg, color: Colors.red);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
