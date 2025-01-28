import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../bloc/drop_down_cubit.dart';

class CardItemDropMenuHome extends StatelessWidget {
  final String title;
  final String svgPath;
  final String greenSvgPath;
  final String selectedCard;
  final GlobalKey<ExpansionTileCardState> expansionKey;

  const CardItemDropMenuHome({
    super.key,
    required this.title,
    required this.svgPath,
    required this.greenSvgPath,
    required this.selectedCard,
    required this.expansionKey,
    required BuildContext context,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedCard == title;
    String? leadingIcon;
    return ListTile(
      trailing: null != leadingIcon
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    expansionKey.currentState?.collapse();
                  },
                  child: SvgPicture.asset(
                    leadingIcon,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 5), // إضافة مساحة بمقدار 5 على يمين الأيقونة
              ],
            )
          : null,
      title: Text(
        title,
        style: isSelected ? AppTextStyle.f14W400green : AppTextStyle.f14W400xxx,
      ),
      leading: Container(
        height: 35,
        width: 35,
        child: SvgPicture.asset(
          isSelected ? greenSvgPath : svgPath,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        context.read<DropDownMenuCubit>().selectCard(title);
        expansionKey.currentState?.collapse();
      },
    );
  }
}
