import 'package:dio/dio.dart';
import 'package:ferpo/features/authentication/bloc/super_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../features/authentication/screens/dio.dart';

class CubitAbstract extends Cubit<SuperState> {
  CubitAbstract() : super(InitialState());
  void showToast(String msg, {Color color = Colors.green, String time = 'l'}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: time == 'l' ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> requestMain({
    required Future<void> Function() request,
    required DioErrorState error,
    required SuperState load,
    bool isGoToLogin = true,
  }) async {
    // if(StorageApp.box.hasData(KeysStorage.token)||!isGoToLogin) {
    try {
      emit(load);
      await request();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        print("Connection Timeout: Couldn't connect to the server in time.");
        error.errorMsg =
            "فشل الاتصال بالخادم بسبب انقضاء المهلة المحددة. يرجى اعادة المحاولة.";
        emit(error);
      } else if (e.type == DioExceptionType.cancel) {
        print("Connection cancel: cancel done");
        error.errorMsg = "تم الغاء العملية السابقة";
        emit(error);
      } else if (e.response != null) {
        if (e.response?.data != null) {
          print("DioException: ${e.response?.data}");
          if (e.response?.statusCode == 500 || e.response?.statusCode == 404) {
            error.errorMsg = 'server not response...\n please try again';
            print(e.response?.data);
            emit(error);
          } else {
            print(e.response?.statusCode);
            error.errorMsg = e.response?.data.toString() ?? '';
            print(error.errorMsg);
            emit(error);
          }
        }
      } else {
        print("DioException: ${e.message}");
        error.errorMsg = e.message.toString();
        emit(error);
      }
    } catch (e) {
      error.errorMsg = e.toString();
      emit(error);
      print('error $e');
    }

    // }
    // else {
    //   ////print('GotoLoginState');
    //   showToast('go_to_login'.tr());
    //
    //   Future.microtask(() {
    //     navigatorKey.currentState?.pushReplacement(MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //         create: (context) => CubitAuth(),
    //         child: LoginScreen(),
    //       ),
    //     ));
    //   });

    //  emit(GotoLoginState());
    // }
  }

  Dio dio = MyDio().init();
}
