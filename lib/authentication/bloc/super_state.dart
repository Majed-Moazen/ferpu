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
  final Map<String, dynamic> response;

  LoginSuccessState(this.response);
}

class LoginErrorState extends DioErrorState {}

class OtpLoadingState extends SuperState {}

class OtpSuccessState extends SuperState {}

class OtpErrorState extends DioErrorState {}

class PhoneValidationState extends SuperState {
  final bool isValid;
  final String errorMessage;

  PhoneValidationState({required this.isValid, required this.errorMessage});
}

class OtpValidationState extends SuperState {
  final bool isValid;
  OtpValidationState({required this.isValid});
}
