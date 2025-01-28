import 'package:flutter/material.dart';

import '../../../core/generic_widgets/arrow_back_widget.dart';
import '../../../core/generic_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../../core/generic_widgets/main_button.dart';
import '../../../core/theme/app_text_style.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  TextEditingController emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 24.0, left: 24, right: 24, top: 64),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArrowBackWidget(),
            SizedBox(
              height: 20,
            ),
            Text(
              "Forgot Password" /*AppStrings.signIn.tr()*/,
              style: AppTextStyle.f32W700Black,
            ),
            SizedBox(
              height: 32,
            ),
            CustomTextFormField(
              onChanged: (p0) {},
              hintText:
                  "Enter Email Address" /*AppStrings.enterEmailAddress.tr()*/,
              controller: emailAddressController,
              svgPath: '',
            ),
            SizedBox(
              height: 24,
            ),
            MainButton(
                text: "Continue" /*AppStrings.signIn.tr()*/,
                onPressed: () {
                  print('Hello World!');
                }),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
