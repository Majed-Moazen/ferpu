import 'package:dio/dio.dart';
import 'package:ferpo/core/bloc/super_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/constants/app_strings.dart';
import 'cubit_abstract.dart';

class CubitAuth extends CubitAbstract {
  String _phone = "";
bool isValidPhone=false;
  void validatePhone(String phone) {
    print(phone.length);
    if (phone.length == 9) {

      isValidPhone=true;
      emit(PhoneValidationState());
    }
    else {
      isValidPhone=false;
      emit(PhoneValidationState());
    }
  }

  Future<void> login() async {
    await requestMain(
      request: () async {
        String? fcm = await FirebaseMessaging.instance.getToken();
        Response response =
            await dio.post('login', data: {'phone': _phone, 'fcmToken': fcm});
        emit(LoginSuccessState(response.data));
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
