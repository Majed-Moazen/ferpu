// import 'package:ferpo/favorite/pages/favorite_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../core/generic_widgets/bottom_navigation_bar/bottom_navigation_bar_items.dart';
// import '../../core/generic_widgets/bottom_navigation_bar/cubit/bottom_navigation_cubit.dart';
// import '../../orders/pages/order_screen.dart';
// import '../../profile/pages/profile_screen.dart';
// import 'home_screen.dart';
//
// class MainScreen extends StatelessWidget {
//   MainScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => BottomNavigationCubit()..loadUserId(),
//       child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
//         builder: (context, state) {
//           // إذا كانت البيانات قيد التحميل
//           if (state.isLoading) {
//             return const Center(child: CircularProgressIndicator());
//           }
//
//           // إذا حدث خطأ أثناء التحميل
//           if (state.error != null) {
//             return Center(
//               child: Text(
//                 "Error: ${state.error}",
//                 style: const TextStyle(color: Colors.red),
//               ),
//             );
//           }
//
//           if (state.userId == null) {
//             return const Center(child: Text('User ID not found.'));
//           }
//
//           final userId = state.userId!;
//           List<Widget> pages = [
//             HomeScreen(),
//             FavoriteScreen(),
//             OrderScreen(),
//             ProfileScreen(),
//           ];
//
//           return Scaffold(
//             body: pages[state.pageIndex],
//             bottomNavigationBar: SizedBox(
//               height: 100,
//               child: BottomNavigationBar(
//                 currentIndex: state.pageIndex,
//                 onTap: (index) {
//                   context
//                       .read<BottomNavigationCubit>()
//                       .changePageIndex(newPageIndex: index);
//                 },
//                 elevation: 10.0,
//                 type: BottomNavigationBarType.fixed,
//                 items: [
//                   bottomNavBarItem(
//                     title: '',
//                     icon: state.pageIndex == 0
//                         ? "assets/images/svg/selected_home_icon.svg"
//                         : "assets/images/svg/unselected_home_icon.svg",
//                   ),
//                   bottomNavBarItem(
//                     title: '',
//                     icon: state.pageIndex == 1
//                         ? "assets/images/svg/selected_notification_icon.svg"
//                         : "assets/images/svg/unselected_notification_icon.svg",
//                   ),
//                   bottomNavBarItem(
//                     title: '',
//                     icon: state.pageIndex == 2
//                         ? "assets/images/svg/selected_order_icon.svg"
//                         : "assets/images/svg/unselected_order_icon.svg",
//                   ),
//                   bottomNavBarItem(
//                     title: '',
//                     icon: state.pageIndex == 3
//                         ? "assets/images/svg/selected_profile_icon.svg"
//                         : "assets/images/svg/unselected_profile_icon.svg",
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
import 'package:ferpo/favorite/pages/favorite_screen.dart';
import 'package:flutter/material.dart';
import '../../orders/pages/order_screen.dart';
import '../../profile/pages/profile_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int pageIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      HomeScreen(),
      FavoriteScreen(),
      OrderScreen(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              backgroundColor: Colors.red,
              currentIndex: pageIndex,
              onTap: (index) {
                setState(() {
                  pageIndex = index;
                });
              },
              elevation: 10.0,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Home Page'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_none_outlined),
                    label: 'Notification'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
