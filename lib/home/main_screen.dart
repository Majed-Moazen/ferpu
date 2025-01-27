import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/bloc/home_cubit.dart';
import '../core/bloc/super_state.dart';
import '../core/constants/app_images.dart';
import '../core/theme/app_colors.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FirebaseMessaging.onMessage.listen(
    //       (message) {
    //     if (mounted) {
    //       context.read<CubitHome>().showNotification(message);
    //     }
    //   },
    // );

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   if (mounted) {
    //     context.read<CubitHome>().onTapBottom(2);
    //   }
    // });
    // if (StorageApp.box.hasData(KeysStorage.token)) {
    //   context.read<CubitHome>().getUser();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.height,80.h, ),
        child: Container(
          decoration: BoxDecoration(color: Colors.transparent, boxShadow: [
            BoxShadow(
                color: AppColors.shadowAppbar,
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(0, 0),
                blurStyle: BlurStyle.outer)
          ]),
          child: AppBar(
            backgroundColor: Colors.transparent,

            // leadingWidth: 96.w,
            leading: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 16.r, bottom: 4.r, top: 4.r),
              child: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Image.asset(
                  AppImages.avatar,
                  height: 64.h,
                  width: 64.w,
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    color: AppColors.titleGray,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  'User Name',
                  style: TextStyle(

                    color: AppColors.titleBlack,
                    fontSize: 20.sp,
                    fontFamily: 'cocon'
                  ),
                ),
                Text(
                  'Your attire, your vitality',
                  style: TextStyle(
                    color: AppColors.titleGray,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: SvgPicture.asset(
                  AppImages.homeActive,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: SvgPicture.asset(
                  AppImages.homeActive,
                  width: 24.w,
                  height: 24.h,
                ),
              ),
              SizedBox(
                width: 8.sp,
              )
            ],
          ),
        ),
      ),
      body: BlocBuilder<CubitHome, SuperState>(
        buildWhen: (previous, current) => current is ChangeBottomState,
        builder: (context, state) => IndexedStack(
            index: context.read<CubitHome>().indexBottom,
            children: context.read<CubitHome>().pages),
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 64.h,
        margin: EdgeInsets.only(left: 16.r, right: 16.0.r, bottom: 46.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(44.r),
            boxShadow: [
              BoxShadow(
                  color: Color(0x47474714),
                  blurStyle: BlurStyle.outer,
                  offset: Offset(0, 0),
                  spreadRadius: 5,
                  blurRadius: 5)
            ]),
        child: BlocBuilder<CubitHome, SuperState>(
            buildWhen: (previous, current) => current is ChangeBottomState,
            builder: (BuildContext context, SuperState state) =>
                BottomNavigationBar(
                    showUnselectedLabels: true,
                    currentIndex: context.read<CubitHome>().indexBottom < 5
                        ? context.read<CubitHome>().indexBottom
                        : 0,
                    backgroundColor: Colors.white,
                    selectedLabelStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff34988E),
                    ),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                    type: BottomNavigationBarType.fixed,
                    onTap: (int tap) {
                      context.read<CubitHome>().onTapBottom(tap);
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
                          backgroundColor: Theme.of(context)
                              .bottomNavigationBarTheme
                              .backgroundColor,
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
                          label: 'notification'.tr()),
                      BottomNavigationBarItem(
                          backgroundColor: Theme.of(context)
                              .bottomNavigationBarTheme
                              .backgroundColor,
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
                          label: context.tr('vitals')),
                      BottomNavigationBarItem(
                          backgroundColor: Theme.of(context)
                              .bottomNavigationBarTheme
                              .backgroundColor,
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
                          label: 'profile'.tr()),
                    ])),
      ),
    );
  }
}
