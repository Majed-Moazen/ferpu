import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants/app_images.dart';
import '../cubit/bottom_navigation_cubit.dart';

class ContainerNavBar extends StatelessWidget {
  const ContainerNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 64.h,
      margin: EdgeInsets.only(left: 16.r, right: 16.r, bottom: 46.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(44.r),
        boxShadow: [
          BoxShadow(
            color: const Color(0x47474714),
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 0),
            spreadRadius: 5,
            blurRadius: 5,
          ),
        ],
      ),
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            showUnselectedLabels: true,
            currentIndex: state.pageIndex,
            backgroundColor: Colors.white,
            selectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xff34988E),
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context
                  .read<BottomNavigationCubit>()
                  .changePageIndex(newPageIndex: index);
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppImages.homeActive,
                  height: 24.h,
                  width: 24.h,
                ),
                icon: SvgPicture.asset(
                  AppImages.homeDeActive,
                  height: 24.h,
                  width: 24.h,
                ),
                label: 'home'.tr(),
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppImages.notificationActive,
                  height: 24.h,
                  width: 24.h,
                ),
                icon: SvgPicture.asset(
                  AppImages.notificationDeActive,
                  height: 24.h,
                  width: 24.h,
                ),
                label: 'notification'.tr(),
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppImages.vitalsActive,
                  height: 24.h,
                  width: 24.h,
                ),
                icon: SvgPicture.asset(
                  AppImages.vitalsDeActive,
                  height: 24.h,
                  width: 24.h,
                ),
                label: 'Report'.tr(),
              ),
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  AppImages.profileActive,
                  height: 24.h,
                  width: 24.h,
                ),
                icon: SvgPicture.asset(
                  AppImages.profileDeActive,
                  height: 24.h,
                  width: 24.h,
                ),
                label: 'profile'.tr(),
              ),
            ],
          );
        },
      ),
    );
  }
}
