import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_strings.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import 'bloc/text_form_field_cubit.dart';
import 'bloc/text_form_field_state.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    this.hintText,
    this.isPassword = false,
    this.isConfirmPassword = false,
    required this.controller,
    required this.svgPath,
    required this.onChanged,
  });

  final String? hintText;
  Function(String) onChanged;
  bool isPassword;
  bool isConfirmPassword;
  TextEditingController controller;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        onChanged(value);
      },
      cursorColor: AppColors.thirdColor,
      controller: controller,
      decoration: InputDecoration(
        prefixIconConstraints: BoxConstraints(
          maxWidth: 100.w,
          maxHeight: 24.h,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 8),
              SvgPicture.asset(
                svgPath,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        fillColor: AppColors.textFormFaildColor,
        filled: true,
        hintText: hintText,
        hintStyle: AppTextStyle.f14W400grey,
        contentPadding: EdgeInsets.symmetric(
          vertical: 12.h,
          // تقليل أو زيادة هذا الرقم لتعديل المساحة الداخلية
          horizontal: 20.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Color(0xFF000043),
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
