import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_style.dart';

class OrderSubmitButton extends StatelessWidget {
  const OrderSubmitButton({
    super.key,
    required this.title,
    required this.onTab,
    required this.color,
  });
  final String title;
  final VoidCallback onTab;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      color: color,
      onPressed: onTab,
      child: Text(
        title,
        style: AppTextStyle.f14W600white,
      ),
    );
  }
}
