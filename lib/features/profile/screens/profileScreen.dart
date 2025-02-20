import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_text_style.dart';
import '../bloc/profile_cubit.dart';
import '../bloc/profile_state.dart';
import '../geniric_eidjet/custom_profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: AppTextStyle.f24W700Black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                final profileState = state as ProfileUpdated;
                return Container(
                  height: 100,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: profileState.profileImage != null
                                ? FileImage(profileState.profileImage!)
                                    as ImageProvider
                                : AssetImage('assets/images/png/Image.png'),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () => context
                                  .read<ProfileCubit>()
                                  .pickProfileImage(),
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                padding: EdgeInsets.all(4),
                                child: SvgPicture.asset(
                                    'assets/images/svg/Icon.svg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 16),
                          Text(
                            'User Name',
                            style: AppTextStyle.f24W400name,
                          ),
                          Text(
                            'example.user@gmail.com',
                            style: AppTextStyle.f14W400grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Divider(color: Colors.grey.withOpacity(0.3)),
            CustomProfileItem(
              leadingSvg: 'assets/images/svg/profile.svg',
              trailingSvg: 'assets/images/svg/Chevron.svg',
              text: 'Edit Profile',
            ),
            16.h.verticalSpace,
            CustomProfileItem(
              leadingSvg: 'assets/images/svg/notification-bing.svg',
              trailingSvg: 'assets/images/svg/Chevron.svg',
              text: 'Notifications',
            ),
            16.h.verticalSpace,
            CustomProfileItem(
              leadingSvg: 'assets/images/svg/vitals_profile.svg',
              trailingSvg: 'assets/images/svg/Chevron.svg',
              text: 'My Report',
            ),
            16.h.verticalSpace,
            CustomProfileItem(
              leadingSvg: 'assets/images/svg/securite_profile.svg',
              trailingSvg: 'assets/images/svg/Chevron.svg',
              text: 'Security',
            ),
            16.h.verticalSpace,
            Container(
              height: 40.h,
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/svg/moon.svg'),
                  16.w.horizontalSpace,
                  Text(
                    'Dark Mode',
                    style: AppTextStyle.f16W500xxx,
                  ),
                  Spacer(),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      final profileState = state as ProfileUpdated;
                      return Switch(
                        value: profileState.isDarkMode,
                        onChanged: (value) =>
                            context.read<ProfileCubit>().toggleDarkMode(),
                        activeColor: Colors.green,
                        inactiveThumbColor: Colors.grey,
                      );
                    },
                  )
                ],
              ),
            ),
            16.h.verticalSpace,
            CustomProfileItem(
              leadingSvg: 'assets/images/svg/settings.svg',
              trailingSvg: 'assets/images/svg/Chevron.svg',
              text: 'Settings',
            ),
            16.h.verticalSpace,
            CustomProfileItem(
              leadingSvg: 'assets/images/svg/fqa.svg',
              trailingSvg: 'assets/images/svg/Chevron.svg',
              text: 'FAQ',
            ),
            16.h.verticalSpace,
            CustomProfileItem(
              leadingSvg: 'assets/images/svg/about_as.svg',
              trailingSvg: 'assets/images/svg/Chevron.svg',
              text: 'About Fabrioo',
            ),
            16.h.verticalSpace,
            Container(
              height: 40.h,
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/svg/login.svg'),
                  16.w.horizontalSpace,
                  Text(
                    'Logout',
                    style: AppTextStyle.f16W500red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
