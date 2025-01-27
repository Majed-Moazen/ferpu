
import 'package:dio/dio.dart';
import 'package:ferpo/core/bloc/super_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import '../../home/home.dart';
import 'cubit_abstract.dart';


class CubitHome extends CubitAbstract {

  List<Widget> pages = [
    Home(),

  ];
  List<String> titlePages = [
    'products',
    'faviourite',
    'my_orders',
    'profile',
    'payment_methods',
  ];
  late Widget backBody;

  int indexBottom = 0;
  List<bool> isLoadedPage = List.generate(
    3,
        (index) => false,
  );

  void onTapBottom(int tap) {
    indexBottom = tap;
    // if (indexBottom == 1 && !isLoadedPage[0]) {
    //   getAllFavorite();
    //   isLoadedPage[0] = true;
    // } else if (indexBottom == 2 && !isLoadedPage[1]) {
    //   getMyOrers();
    //   isLoadedPage[1] = true;
    // } else if (indexBottom == 4 && !isLoadedPage[2]) {
    //   getPaymentMethods();
    //   isLoadedPage[2] = true;
    // }
    emit(ChangeBottomState());
  }

  void pushHomeScreen(Widget screen) {
    pages.add(screen);
    onTapBottom(pages.length - 1);
    emit(ChangeBottomState());
  }

  void popHomeScreen() {
    print(pages.length);
    print(indexBottom);
    pages.removeLast();

    if (pages.length == 5) {
      onTapBottom(0);
    } else {
      onTapBottom(pages.length - 1);
    }
    emit(ChangeBottomState());
  }

  Future<void> loginNumber(String phone,) async {
    await requestMain(
        request: () async {
          String? fcm = await FirebaseMessaging.instance.getToken();

          Response response = await dio
              .post('loginNumber', data: {'email': phone, 'fcmToken': fcm});

          ////print(response.data);
          // User user = User.fromJson(response.data['user']);
          // await GetStorage().write(KeysStorage.user,);
          // await GetStorage().write(KeysStorage.token, response.data['token']);
          // emit(LoginSuccessState());
        },
        error: LoginErrorState(),
        load: LoginLoadingState());
  }
}