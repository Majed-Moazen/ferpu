import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingImageSwitcher2 extends StatefulWidget {
  @override
  _OnBoardingTextSwitcherState createState() => _OnBoardingTextSwitcherState();
}

class _OnBoardingTextSwitcherState extends State<OnBoardingImageSwitcher2> {
  late Timer _timer;
  int _currentTextIndex = 0;

  final List<String> texts = [
    "assets/images/svg/choice.svg",
    "assets/images/svg/shirt.svg",
    "assets/images/svg/hoodie.svg",
  ];

  @override
  void initState() {
    super.initState();
    _startTextSwitcher();
  }

  void _startTextSwitcher() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentTextIndex = (_currentTextIndex + 1) % texts.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      child: SvgPicture.asset(
        texts[_currentTextIndex],
        key: ValueKey<int>(_currentTextIndex),
        width: 50,
        height: 50,
      ),
    );
  }
}
