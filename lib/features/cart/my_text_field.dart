import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
   MyTextField({required this.title});
String title;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(12.r) ),
      ),
    );
  }
}
