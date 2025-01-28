import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAddToCard extends StatelessWidget {
  const CustomAddToCard({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Positioned(
        left: 7,
        top: 7,
        child: SvgPicture.asset(
            height: 15, width: 15, 'assets/images/svg/plus.svg'),
      ),
    );
  }
}
