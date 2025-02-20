abstract class SuperState {}

class InitialState extends SuperState {}

class DioErrorState extends SuperState {
  String errorMsg = '';
}

class SignUpLoadingState extends SuperState {}

class SignUpSuccessState extends SuperState {}

class SignUpErrorState extends DioErrorState {}

class LoginLoadingState extends SuperState {}

class ChangedEnableButtonState extends SuperState {
  bool isEnable;

  ChangedEnableButtonState({this.isEnable = false});
}

class ChangedGenderState extends SuperState {
  bool isMale;

  ChangedGenderState({this.isMale = false});
}

class LoginSuccessState extends SuperState {
  // final Map<String, dynamic> response;

  LoginSuccessState();
}

class GoToSignIUp extends SuperState {}

class GoToOtp extends SuperState {}

class LoginErrorState extends DioErrorState {}

class OtpLoadingState extends SuperState {}

class OtpSuccessState extends SuperState {}

class OtpErrorState extends DioErrorState {}

class OtpTimerState extends SuperState {
  int sec;
  OtpTimerState(this.sec);
}

class OtpTimerOutState extends SuperState {}

class AgeUpdatedState extends SuperState {
  final int selectedIndex;
  final bool isAgeSelected;

  AgeUpdatedState(this.selectedIndex, this.isAgeSelected);
}

class ValidationState extends SuperState {}

class ChangedGoalState extends SuperState {}

class OtpValidationState extends SuperState {
  final bool isValid;

  OtpValidationState({required this.isValid});
}

class ChangeBottomState extends SuperState {}
