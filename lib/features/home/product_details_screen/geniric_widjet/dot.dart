import 'package:ferpo/features/home/product_details_screen/bloc/product_details_cubit_screen.dart';
import 'package:ferpo/features/home/product_details_screen/bloc/product_details_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';

class CustomDotController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubitScreen, ProductDetailsScreenState>(
      builder: (context, state) {
        final cubit = context.read<ProductDetailsCubitScreen>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            cubit.currentPage,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 10,
              //width: cubit.currentPage == index ? 20 : 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: cubit.currentPage == index
                    ? AppColors.primaryColor
                    : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        );
      },
    );
  }
}
