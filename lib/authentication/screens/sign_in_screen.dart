import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/authentication/bloc/cubit_auth.dart';
import 'package:ferpo/authentication/bloc/super_state.dart';
import 'package:ferpo/authentication/screens/otp.dart';
import 'package:ferpo/authentication/screens/sign_up_screen.dart';
import 'package:ferpo/core/constants/app_images.dart';
import 'package:ferpo/core/generic_widgets/arrow_back_widget.dart';
import 'package:ferpo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_text_style.dart';
import '../bloc/cubit_abstract.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBackWidget(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 123),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Center(child: SvgPicture.asset(AppImages.logoSvg)),
            SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                AppStrings.enterYourPhoneNumber.tr(),
                style: AppTextStyle.f24W700Black,
              ),
            ),
            SizedBox(height: 50),
            Text(
              AppStrings.phoneNumber.tr(),
              style: AppTextStyle.f14W400grey,
            ),
            TextFormField(
              onChanged: (String value) {
                if (value.length >= 10) {
                  context.read<CubitAuth>().enableButton(true);
                }
              },
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                fillColor: Color(0xFFF3F6FB),
                filled: true,
                hintStyle: AppTextStyle.f14W400grey,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(
                        'assets/images/svg/SY.svg',
                      ),
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.pleaseEnterPhoneNumber;
                }
                return null;
              },
            ),
            SizedBox(height: 40),
            BlocConsumer<CubitAuth, SuperState>(
              builder: (context, state) {
                if (state is LoginLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  );
                }
                return BlocBuilder<CubitAuth, SuperState>(
                  buildWhen: (previous, current) =>
                      current is ChangedEnableButtonState,
                  builder: (BuildContext context, SuperState state) {
                    return MainButton(
                      color: (state as ChangedEnableButtonState).isEnable
                          ? AppColors.enableButton
                          : AppColors.disableButton,
                      text: AppStrings.signIn.tr(),
                      onPressed: () async {
                        String phone = phoneController.text.trim();
                        if (phone.isEmpty || phone.length < 10) {
                          context
                              .read<CubitAuth>()
                              .showToast(AppStrings.invalidPhone);
                          return;
                        }

                        context.read<CubitAuth>().login(phone);
                      },
                    );
                  },
                );
              },
              listener: (BuildContext context, SuperState state) {
                if (state is LoginSuccessState) {
                  // فحص نوع الاستجابة (SignUp أو OTP)
                  final response =
                      state.response; // تحتاج لإضافة response إلى حالة النجاح
                  if (response['screen'] == 'signUp') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  } else if (response['screen'] == 'otp') {
                    context
                        .read<CubitAuth>()
                        .showToast('OTP sent successfully'); // إرسال إشعار
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) =>
                            OtpScreen(phone: phoneController.text), // صفحة OTP
                      ),
                      (Route<dynamic> route) => false,
                    );
                  }
                } else if (state is LoginErrorState) {
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
