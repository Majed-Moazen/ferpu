abstract class OnBoardingState {}

class InitialOnBoardingState extends OnBoardingState {}

class OnBoardingPageChanged extends OnBoardingState {
  final int currentPage;

  OnBoardingPageChanged(this.currentPage);
}
