// import 'package:expansion_tile_card/expansion_tile_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../../core/theme/app_text_style.dart';
//
// class DropDownMenu extends StatefulWidget {
//   const DropDownMenu({super.key});
//
//   @override
//   _DropDownMenuState createState() => _DropDownMenuState();
// }
//
// class _DropDownMenuState extends State<DropDownMenu> {
//   String selectedCard = '';
//   final GlobalKey<ExpansionTileCardState> expansionKey =
//       GlobalKey<ExpansionTileCardState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 0.1,
//             blurRadius: 2,
//           ),
//         ],
//       ),
//       child: ExpansionTileCard(
//         key: expansionKey,
//         baseColor: Colors.white,
//         expandedColor: Colors.white,
//         leading: GestureDetector(
//           onTap: () {
//             // عند الضغط على الأيقونة في أول كارد، تغلق القائمة
//             expansionKey.currentState?.collapse();
//           },
//           child: Text(
//             'Tell us how your Status',
//             style: AppTextStyle.f12W500Secondary,
//           ),
//         ),
//         title: Text(''),
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8.0),
//               border: Border.all(
//                 color: const Color(0xFF585CE5),
//                 width: 1.5,
//               ),
//             ),
//             child: Column(
//               children: [
//                 _buildListTile(
//                   leadingIcon: 'assets/images/svg/arrow up.svg',
//                   title: 'Overwhelmed',
//                   svgPath: 'assets/images/svg/yoga.svg',
//                   greenSvgPath: 'assets/images/svg/yoga_green.svg',
//                 ),
//                 Divider(),
//                 _buildListTile(
//                   title: 'Exhausted',
//                   svgPath: 'assets/images/svg/steps.svg',
//                   greenSvgPath: 'assets/images/svg/steps_green.svg',
//                 ),
//                 Divider(),
//                 _buildListTile(
//                   title: 'Irritated',
//                   svgPath: 'assets/images/svg/running.svg',
//                   greenSvgPath: 'assets/images/svg/running_green.svg',
//                 ),
//                 Divider(),
//                 _buildListTile(
//                   title: 'Limited',
//                   svgPath: 'assets/images/svg/breath.svg',
//                   greenSvgPath: 'assets/images/svg/breath_green.svg',
//                 ),
//               ],
//             ),
//           ),
//         ],
//         trailing: Stack(
//           children: [
//             Container(
//               height: 40,
//               width: 40,
//               child: SvgPicture.asset(
//                 'assets/images/svg/orange_circle.svg',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               left: 5,
//               top: 5,
//               child: GestureDetector(
//                 onTap: () {
//                   expansionKey.currentState
//                       ?.collapse(); // إغلاق القائمة عند الضغط
//                 },
//                 child: Container(
//                   height: 30,
//                   width: 30,
//                   child: SvgPicture.asset(
//                     'assets/images/svg/arrow down.svg',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildListTile({
//     required String title,
//     required String svgPath,
//     required String greenSvgPath,
//     String? leadingIcon,
//   }) {
//     final isSelected = selectedCard == title;
//
//     return ListTile(
//       trailing: leadingIcon != null
//           ? Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       expansionKey.currentState?.collapse();
//                     });
//                   },
//                   child: SvgPicture.asset(
//                     height: 30,
//                     width: 30,
//                     leadingIcon,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(width: 5),
//               ],
//             )
//           : null,
//       title: Text(
//         title,
//         style: isSelected ? AppTextStyle.f14W400green : AppTextStyle.f14W400xxx,
//       ),
//       leading: Container(
//         height: 35,
//         width: 35,
//         child: SvgPicture.asset(
//           isSelected ? greenSvgPath : svgPath,
//           fit: BoxFit.cover,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           selectedCard = title;
//         });
//         expansionKey.currentState?.collapse();
//       },
//     );
//   }
// }
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theme/app_text_style.dart';
import '../bloc/drop_down_cubit.dart';
import '../bloc/drop_down_state.dart';
import '../generic/card_item_drop_menu_home.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DropDownMenuCubit(),
      child: BlocBuilder<DropDownMenuCubit, DropDownMenuState>(
        builder: (context, state) {
          final cubit = context.read<DropDownMenuCubit>();
          String selectedCard = '';
          if (state is CardSelectedState) {
            selectedCard = state.selectedCard;
          }

          final GlobalKey<ExpansionTileCardState> expansionKey =
              GlobalKey<ExpansionTileCardState>();

          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.1,
                  blurRadius: 2,
                ),
              ],
            ),
            child: ExpansionTileCard(
              key: expansionKey,
              baseColor: Colors.white,
              expandedColor: Colors.white,
              leading: GestureDetector(
                onTap: () {
                  cubit.collapseMenu();
                  expansionKey.currentState?.collapse();
                },
                child: Text(
                  'Tell us how your Status',
                  style: AppTextStyle.f12W500Secondary,
                ),
              ),
              title: Text(''),
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: const Color(0xFF585CE5),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      CardItemDropMenuHome(
                        context: context,
                        title: 'Overwhelmed',
                        svgPath: 'assets/images/svg/yoga.svg',
                        greenSvgPath: 'assets/images/svg/yoga_green.svg',
                        selectedCard: selectedCard,
                        expansionKey: expansionKey,
                      ),
                      Divider(),
                      CardItemDropMenuHome(
                        context: context,
                        title: 'Exhausted',
                        svgPath: 'assets/images/svg/steps.svg',
                        greenSvgPath: 'assets/images/svg/steps_green.svg',
                        selectedCard: selectedCard,
                        expansionKey: expansionKey,
                      ),
                      Divider(),
                      CardItemDropMenuHome(
                        context: context,
                        title: 'Irritated',
                        svgPath: 'assets/images/svg/running.svg',
                        greenSvgPath: 'assets/images/svg/running_green.svg',
                        selectedCard: selectedCard,
                        expansionKey: expansionKey,
                      ),
                      Divider(),
                      CardItemDropMenuHome(
                        context: context,
                        title: 'Limited',
                        svgPath: 'assets/images/svg/breath.svg',
                        greenSvgPath: 'assets/images/svg/breath_green.svg',
                        selectedCard: selectedCard,
                        expansionKey: expansionKey,
                      ),
                    ],
                  ),
                ),
              ],
              trailing: Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: SvgPicture.asset(
                      'assets/images/svg/orange_circle.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 5,
                    child: GestureDetector(
                      onTap: () {
                        cubit.collapseMenu();
                        expansionKey.currentState?.collapse();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        child: SvgPicture.asset(
                          'assets/images/svg/arrow down.svg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
