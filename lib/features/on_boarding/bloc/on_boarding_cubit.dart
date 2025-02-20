import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../authentication/screens/sign_in_screen.dart';
import '../bloc/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(InitialOnBoardingState());

  final PageController pageController = PageController();

  final List<String> backgroundImages = [
    "assets/images/png/Union.png",
    "assets/images/png/Union (1).png",
    "assets/images/png/Union (2).png",
  ];

  int currentPage = 0;

  void nextPage(BuildContext context) {
    if (currentPage < backgroundImages.length - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      skipOnBoarding(context); // عند آخر صفحة، ينتقل إلى شاشة تسجيل الدخول
    }
    emit(OnBoardingPageChanged(currentPage));
  }

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnBoardingPageChanged(currentPage));
  }

  String getBackgroundImage() {
    return backgroundImages[currentPage];
  }

  void skipOnBoarding(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => SignInScreen()),
    );
  }
}
