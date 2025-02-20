import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ferpo/features/authentication/bloc/super_state.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../core/bloc/cubit_abstract.dart';
import '../model/goal.dart';
import '../model/user.dart';

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

  User user = User(
      id: 0,
      email: '',
      name: '',
      phone: '',
      gender: '1',
      isActive: 0,
      goal: 0,
      createdAt: '',
      updatedAt: '',
      fcmToken: '');

  int _selectedIndex = 0;

  bool isAgeSelected = false;

  void selectAge(int index) {
    _selectedIndex = index;
    user.ageRange = _selectedIndex;
    emit(AgeUpdatedState(_selectedIndex, isAgeSelected));
  }

  Timer? timer;
  void timeOtp(int sec) {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (sec > 0) {
        sec = sec - 1;
        emit(OtpTimerState(sec));
      } else {
        emit(OtpTimerOutState());

        timer.cancel();
      }
    });
  }

  void validateName({required String name}) {
    if (name.isNotEmpty) {
      isValidSignUp = true;
      emit(ValidationState());
    } else {
      isValidSignUp = false;
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
    required int goal,
    required int age_ragne,
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
          'age_ragne': age_ragne,
          'goal': goal,
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

  void toggleGoal(int index) {
    GoalModel.data
        .map(
          (e) => e.isSelected = false,
        )
        .toList();
    print(GoalModel.data.join());
    GoalModel.data[index].isSelected = true;

    emit(ChangedGoalState());
  }

  bool activeButtonOtp = false;

  void validateOtp(String otp) {
    if (otp.length == 4) {
      activeButtonOtp = true;
      emit(ValidationState());
    } else {
      activeButtonOtp = false;
      emit(ValidationState());
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
