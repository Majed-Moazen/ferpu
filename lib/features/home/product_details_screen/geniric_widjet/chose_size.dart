import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_text_style.dart';
import '../bloc/product_details_cubit_screen.dart';
import '../bloc/product_details_screen_state.dart';

class ChoseSize extends StatelessWidget {
  const ChoseSize({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubitScreen, ProductDetailsScreenState>(
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubitScreen>();
        final isSelected = cubit.selectedSize == text;

        return GestureDetector(
          onTap: () {
            cubit.selectSize(text);
          },
          child: Container(
            height: 25.h,
            width: 50.w,
            child: Center(
              child: Text(
                text,
                style: AppTextStyle.f12W400black.copyWith(
                  color: isSelected ? Colors.black : Colors.black,
                ),
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: isSelected ? Color(0xFFA8C4FFA8) : Colors.grey.shade100,
            ),
          ),
        );
      },
    );
  }
}
