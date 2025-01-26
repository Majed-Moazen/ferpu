import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/home/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_text_style.dart';
import '../bloc/cubit_auth.dart';
import '../bloc/super_state.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({super.key, required this.phone});
  final String phone;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  OtpFieldController otpController = OtpFieldController();
  CubitAuth cubitAuth = CubitAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 24.0, left: 24, right: 24, top: 123),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.otpCode.tr(),
              style: AppTextStyle.f32W700Black,
            ),
            SizedBox(height: 32),
            OTPTextField(
              controller: otpController,
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: TextStyle(fontSize: 20),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.box,
              onCompleted: (String verificationCode) {
                context
                    .read<CubitAuth>()
                    .checkCode(widget.phone, verificationCode);
              },
            ),
            SizedBox(height: 16),
            BlocConsumer<CubitAuth, SuperState>(
              listener: (context, state) {
                if (state is OtpSuccessState) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                } else if (state is OtpErrorState) {
                  cubitAuth.showToast(state.errorMsg, color: Colors.red);
                }
              },
              builder: (context, state) {
                if (state is OtpLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return MainButton(
                  text: AppStrings.continuee.tr(),
                  onPressed: () {
                    String otp = otpController.toString();
                    if (otp.isEmpty || otp.length < 6) {
                      cubitAuth.showToast(AppStrings.invalidOtpSend,
                          color: Colors.red);
                    } else {
                      context.read<CubitAuth>().checkCode(widget.phone, otp);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
