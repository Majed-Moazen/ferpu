import 'package:easy_localization/easy_localization.dart';
import 'package:ferpo/core/generic_widgets/arrow_back_widget.dart';
import 'package:flutter/material.dart';

class VitalsScreen extends StatelessWidget {
  const VitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: ArrowBackWidget(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('data'),
            ],
          ),
        ),
      ),
    );
  }
}
