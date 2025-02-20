import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class MyDio {
  Dio init() {
    //print(GetStorage().hasData(KeysStorage.token));
    return Dio(
      BaseOptions(
        baseUrl: 'https://admiring-swartz.45-129-180-64.plesk.page/api/',
        // baseUrl: 'http://192.168.43.192:33848/api/',
        headers: {
          // "Authorization":
          //     "Bearer ${StorageApp.box.read(KeysStorage.token)}",
          "Accept": "application/json",
        },
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 25),
      ),
    );
  }
}
