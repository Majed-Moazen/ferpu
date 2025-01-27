import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {this.minWidth = double.infinity,
        required this.text,
        required this.onPressed,
        this.color = AppColors.enableButton});

  final double minWidth;
  final String text;
  final VoidCallback? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed
      ,
      color: color,
      child: Text(
        text,
        style: AppTextStyle.f16W600White,
      ),
      minWidth: double.infinity,
      height: 56,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
