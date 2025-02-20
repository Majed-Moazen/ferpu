import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../core/constants/app_const.dart';
import '../../core/constants/app_images.dart';
import '../on_boarding/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      if ((box.read('isFirstOpen') ?? true) == true) {
        //isFirstOpen should be => AppConst.isFirstOpen
        box.write('isFirstOpen', false);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OnBoardingScreen(),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000043),
      body: Center(
          //child: Lottie.asset('assets/images/lottie/clothes_1.lottie'),
          ),
    );
  }
}
