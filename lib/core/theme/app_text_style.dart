import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyle {
  //// Font Size 12
  static const TextStyle f12W500Black =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black);

  static const TextStyle f12W700Black =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: Colors.black);

  ///////// Font Size 14
  static const TextStyle f14W400grey = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14, color: Color(0XFF838387));
  static const TextStyle f14W400SecondColor = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: AppColors.secondaryColor);

  //// Font Size 16
  static const TextStyle f16W400HintTextColor = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: AppColors.secondaryColor);
  static const TextStyle f16W700SecondColor = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: AppColors.secondaryColor);
  static const TextStyle f16W500xxx = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF404040));

  static const TextStyle f16W600xxx = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF404040));
  static const TextStyle f16W6001A1A1A = TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF1A1A1A));

  static const TextStyle f16W600White =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white);

  ///// Font Size 32
  static const TextStyle f32W700Black = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: AppColors.secondaryColor);

  /////////  Font Size 24
  static const TextStyle f24W700Black = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: AppColors.secondaryColor);
}
