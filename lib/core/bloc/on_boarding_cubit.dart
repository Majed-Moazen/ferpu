import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../authentication/screens/sign_in_screen.dart';
import '../../features/on_boarding/model/on_boarding_model.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(InitialOnBoardingState());

  final PageController pageController = PageController();
  final List<OnBoarderModel> onBoarderList = [
    OnBoarderModel(
      title: "مرحبًا بك في تطبيق التوصيل الخاص بك",
      image: "assets/images/jpg/onboard1.png",
      body: "نحن هنا لتلبية طلباتك بأسرع وقت وبأفضل جودة.",
    ),
    OnBoarderModel(
      title: "سهولة في الاستخدام",
      image: "assets/images/jpg/onboard3.jpg",
      body: "اختر منتجاتك من مجموعة واسعة بنقرة واحدة فقط",
    ),
    OnBoarderModel(
      title: "توصيل سريع وآمن",
      image: "assets/images/jpg/onboard4.jpg",
      body: "نضمن توصيل طلباتك إلى باب منزلك بكل سهولة وأمان",
    ),
  ];

  int currentPage = 0;

  void nextPage(BuildContext context) {
    if (currentPage < onBoarderList.length - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(OnBoardingPageChanged(currentPage));
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => SignInScreen()),
      );
    }
  }

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnBoardingPageChanged(currentPage));
  }
}
