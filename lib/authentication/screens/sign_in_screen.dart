import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/authentication/bloc/cubit_auth.dart';
import 'package:ferpo/authentication/bloc/super_state.dart';
import 'package:ferpo/core/constants/app_images.dart';
import 'package:ferpo/core/generic_widgets/arrow_back_widget.dart';
import 'package:ferpo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_strings.dart';
import '../../core/generic_widgets/main_button.dart';
import '../../core/theme/app_text_style.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ArrowBackWidget(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 123),
        child: BlocListener<CubitAuth, SuperState>(
          listener: (context, state) {
            if (state is PhoneValidationState && !state.isValid) {
              // عرض رسالة الخطأ عند الإدخال غير صحيح
              context.read<CubitAuth>().showToast(state.errorMessage);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              Center(child: SvgPicture.asset(AppImages.logoSvg)),
              SizedBox(height: 24),
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
              BlocBuilder<CubitAuth, SuperState>(
                builder: (context, state) {
                  String? errorMessage;
                  bool isValid = false;

                  if (state is PhoneValidationState) {
                    errorMessage = state.errorMessage;
                    isValid = state.isValid;
                  }

                  return Column(
                    children: [
                      TextFormField(
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
                          errorText: errorMessage, // عرض رسالة الخطأ
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          // التحقق عند الإدخال
                          context.read<CubitAuth>().validatePhone(value);
                        },
                      ),
                      SizedBox(height: 40),
                      MainButton(
                        color: isValid
                            ? AppColors.enableButton
                            : AppColors.disableButton,
                        text: AppStrings.signIn.tr(),
                        onPressed: isValid
                            ? () async {
                                String phone = phoneController.text.trim();
                                context.read<CubitAuth>().login();
                              }
                            : () {}, // تعطيل الزر إذا كان الإدخال غير صالح
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
