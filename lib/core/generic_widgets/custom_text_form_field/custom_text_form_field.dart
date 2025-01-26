import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import 'bloc/text_form_field_cubit.dart';
import 'bloc/text_form_field_state.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.hintText,
      this.isPassword = false,
      this.isConfirmPassword = false,
      required this.controller});

  final String? hintText;
  bool isPassword;
  bool isConfirmPassword;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFormFieldCubit, TextFormFieldState>(
      builder: (context, state) {
        return TextFormField(
          controller: controller,
          decoration: InputDecoration(
            //fillColor: AppColors.primaryColor,
            //filled: true,
            hintText: hintText,
            hintStyle: AppTextStyle.f16W400HintTextColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none),
            suffixIcon: Visibility(
                visible: isPassword || isConfirmPassword,
                child: IconButton(
                  onPressed: () {
                    if (isPassword)
                      context.read<TextFormFieldCubit>().changeHiddenStatue();
                    else if (isConfirmPassword)
                      context
                          .read<TextFormFieldCubit>()
                          .changeConfrimHiddenStatue();
                  },
                  icon: Icon(isPassword
                      ? (context.read<TextFormFieldCubit>().hiddenPassword)
                          ? Icons.visibility_off
                          : Icons.visibility
                      : (isConfirmPassword)
                          ? (context
                                  .read<TextFormFieldCubit>()
                                  .hiddenConfirmPassword)
                              ? Icons.visibility_off
                              : Icons.visibility
                          : null),
                )),
          ),
          obscureText: isPassword
              ? context.read<TextFormFieldCubit>().hiddenPassword
              : isConfirmPassword
                  ? context.read<TextFormFieldCubit>().hiddenConfirmPassword
                  : false,
        );
      },
    );
  }
}
