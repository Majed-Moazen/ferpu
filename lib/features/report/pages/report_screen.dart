import 'package:ferpo/core/constants/app_strings.dart';
import 'package:ferpo/core/constants/app_images.dart';
import 'package:ferpo/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../generic_widjet/grid_view_rate.dart';
import '../wedjet/build_info_container_widjet.dart';
import '../wedjet/build_performance_container_wedjet.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppStrings.report, // استخدام النص من AppStrings
          style: AppTextStyle.f24W700Black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.h.verticalSpace,
              BuildInfoContainerWidjet(),
              24.h.verticalSpace,
              Text(
                AppStrings.saturday, // استخدام النص من AppStrings
                style: AppTextStyle.f14W500subTitle,
              ),
              4.h.verticalSpace,
              Text(
                AppStrings.vitalsSummary, // استخدام النص من AppStrings
                style: AppTextStyle.f16W500xxx,
              ),
              16.h.verticalSpace,
              BuildPerformanceContainerWedjet(),
              24.h.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        GridViewRate(
                          title1: AppStrings.heartRate,
                          title2: AppStrings.value162,
                          title3: AppStrings.bpm,
                          svgPath: AppImages.loveSvg,
                        ),
                        10.h.verticalSpace,
                        GridViewRate(
                          title1: AppStrings.bodyTemperature,
                          title2: AppStrings.celsius,
                          svgPath: AppImages.temperatureSvg,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        GridViewRate(
                          title1: AppStrings.breathingPattern,
                          title2: AppStrings.rapid,
                          svgPath: AppImages.reatenSvg,
                        ),
                        10.h.verticalSpace,
                        GridViewRate(
                          title1: AppStrings.stressLevel,
                          title2: AppStrings.high,
                          svgPath: AppImages.mindSvg,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
