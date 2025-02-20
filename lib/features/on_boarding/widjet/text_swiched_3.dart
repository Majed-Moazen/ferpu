import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingImageSwitcher3 extends StatefulWidget {
  final int pageIndex;

  const OnBoardingImageSwitcher3({Key? key, required this.pageIndex})
      : super(key: key);

  @override
  _OnBoardingImageSwitcherState createState() =>
      _OnBoardingImageSwitcherState();
}

class _OnBoardingImageSwitcherState extends State<OnBoardingImageSwitcher3> {
  late Timer _timer;
  int _currentImageIndex = 0;

  final List<List<String>> images = [
    [
      "assets/images/svg/feel.svg",
      "assets/images/svg/perform.svg",
      "assets/images/svg/live.svg",
    ]
  ];

  List<String> get _currentImages =>
      images[0];

  @override
  void initState() {
    super.initState();
    _startImageSwitcher();
  }

  void _startImageSwitcher() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentImageIndex = (_currentImageIndex + 1) % _currentImages.length;
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
        _currentImages[_currentImageIndex],
        key: ValueKey<int>(_currentImageIndex),
        width: 50,
        height: 50,
      ),
    );
  }
}