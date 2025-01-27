import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/authentication/screens/user_goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_colors.dart';
import '../bloc/cubit_auth.dart';
import '../bloc/super_state.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, required this.phone});
  final String phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpController = TextEditingController();
  bool isOtpValid = false; // متغير للتحقق من صحة الإدخال

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 24.0, left: 24, right: 24, top: 123),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // باقي الواجهة...
              BlocConsumer<CubitAuth, SuperState>(
                listener: (context, state) {
                  if (state is OtpValidationState) {
                    setState(() {
                      isOtpValid = state.isValid;
                    });
                  } else if (state is OtpSuccessState) {
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
                builder: (context, state) {
                  return Column(
                    children: [
                      Pinput(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        controller: otpController,
                        length: 4,
                        keyboardType: TextInputType.number,
                        defaultPinTheme: PinTheme(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          textStyle: TextStyle(fontSize: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F6FB),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.secondaryColor,
                              width: 1.5,
                            ),
                          ),
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
                      SizedBox(height: 27.h),
                      MainButton(
                        text: AppStrings.continuee.tr(),
                        color: isOtpValid
                            ? AppColors.enableButton
                            : AppColors.disableButton,
                        onPressed: isOtpValid
                            ? () {
                                String otp = otpController.text.trim();
                                context
                                    .read<CubitAuth>()
                                    .checkCode(widget.phone, otp);
                              }
                            : () {}, // تعطيل الزر إذا لم يكن الإدخال صحيحًا
                      ),
                    ],
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
