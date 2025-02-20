import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/generic_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
import '../../../core/generic_widgets/bottom_navigation_bar/generic_widjet/container_nav_bar.dart';
import '../../report/pages/report_screen.dart';
import 'home_screen.dart';
import '../../notification/pages/notification_screen.dart';
import '../../profile/screens/profileScreen.dart';

class MainScreeen extends StatelessWidget {
  const MainScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        final pages = [
          HomeScreen(),
          NotificationScreen(),
          ReportScreen(),
          ProfileScreen(),
        ];

        return Scaffold(
          backgroundColor: Colors.white,
          body: pages[state.pageIndex],
          bottomNavigationBar: ContainerNavBar(),
        );
      },
    );
  }
}
