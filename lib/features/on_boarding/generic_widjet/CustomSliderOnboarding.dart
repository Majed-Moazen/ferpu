import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/on_boarding_cubit.dart';
import '../../../core/bloc/on_boarding_state.dart';



class CustomSliderOnboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return PageView.builder(
          controller: cubit.pageController,
          onPageChanged: cubit.onPageChanged,
          itemCount: cubit.onBoarderList.length,
          itemBuilder: (context, index) {
            final model = cubit.onBoarderList[index];
            return Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 80),
                  Image.asset(
                    model.image!,
                    height: 250,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 80),
                  Text(
                    model.body!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
