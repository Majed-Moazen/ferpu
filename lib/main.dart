import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/home/pages/main_screen.dart';
import 'package:ferpo/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import '../firebase_options.dart';
import 'authentication/bloc/cubit_auth.dart';
import 'core/constants/app_const.dart';
import 'core/generic_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import 'core/generic_widgets/custom_text_form_field/bloc/text_form_field_cubit.dart';

void initializeNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (details) {
      /// todo on press
    },
  );
}

Future<void> initNotification() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.requestPermission();
  String? fcm = await firebaseMessaging.getToken();
  print(fcm);
  // FirebaseMessaging.onBackgroundMessage(ttt);
}

Future<void> showNotification(RemoteMessage message) async {
  await _requestPermission();
  print(message.notification?.title);
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'channel_id',
    'channel_name',
    channelDescription: 'This is the description of the channel.',
    importance: Importance.high,
    priority: Priority.high,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    message.notification?.title ?? '',
    message.notification?.body ?? '',
    platformChannelSpecifics,
  );
}

Future<void> _requestPermission() async {
  if (await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initNotification();
  initializeNotifications();
  FirebaseMessaging.onMessage.listen(
    (message) {
      showNotification(message);
    },
  );
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return TextFormFieldCubit();
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return BottomNavigationCubit();
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return CubitAuth();
          },
        ),
      ],
      child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: AppConst.circularSTD),
          home: SizedBox()),
    );
  }
}
