import 'package:dio/dio.dart';
import 'package:ferpo/core/bloc/super_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'cubit_abstract.dart';

class CubitAuth extends CubitAbstract {
  bool isValid = false;
  bool isValidSignUp = false;

  void validatePhone(String phone) {
    if (phone.length == 9) {
      isValid = true;
      emit(ValidationState());
    } else {
      isValid = false;
      emit(ValidationState());
    }
  }
  void validateEmailAndName({required String email,required String name}) {
    if (email.isNotEmpty&&name.isNotEmpty) {
      isValidSignUp = true;
      emit(ValidationState());
    } else {
      isValidSignUp= false;
      emit(ValidationState());
    }
  }

  Future<void> login(String phone) async {
    await requestMain(
      isGoToLogin: false,
      request: () async {
        print('objectpokjjklkjnkllkk');
        String? fcm = await FirebaseMessaging.instance.getToken();
        print(fcm);
        Response response =
            await dio.post('login', data: {'phone': phone, 'fcmToken': fcm});
        if (response.data['screen'] == "signUp")
          emit(GoToSignIUp());
        else
          emit(GoToOtp());
      },
      error: LoginErrorState(),
      load: LoginLoadingState(),
    );
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String gender,
    required String token,
    required String phone,
  }) async {
    await requestMain(
      isGoToLogin: false,
      request: () async {
        String? fcm = await FirebaseMessaging.instance.getToken();
        Response response = await dio.post('signUp', data: {
          'phone': phone,
          'email': email,
          'name': name,
          'gender': gender,
          'fcmToken': fcm,
        });
        emit(SignUpSuccessState());
      },
      error: SignUpErrorState(),
      load: SignUpLoadingState(),
    );
  }

  Future<void> checkCode(String phone, String otp) async {
    await requestMain(
      request: () async {
        Response response =
            await dio.post('checkCode', data: {'phone': phone, 'otp': otp});
        emit(OtpSuccessState());
      },
      error: OtpErrorState(),
      load: OtpLoadingState(),
    );
  }

  void toggleGender(bool isMale) {
    emit(ChangedGenderState(isMale: isMale));
  }

  void validateOtp(String otp) {
    if (otp.length == 4) {
      emit(OtpValidationState(isValid: true));
    } else {
      emit(OtpValidationState(isValid: false));
    }
  }

  bool _isFormValid = false;

  void validateForm({
    required String name,
    required String email,
    required String phone,
    required String gender,
  }) {
    if (name.isNotEmpty &&
        email.isNotEmpty &&
        email.contains('@') &&
        phone.isNotEmpty &&
        phone.length == 10 &&
        (gender == 'Male' || gender == 'Female')) {
      _isFormValid = true;
      emit(ChangedEnableButtonState(isEnable: true));
    } else {
      _isFormValid = false;
      emit(ChangedEnableButtonState(isEnable: false));
    }
  }

  bool get isFormValid => _isFormValid;
}
