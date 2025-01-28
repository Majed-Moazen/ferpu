import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'drop_down_state.dart';

class DropDownMenuCubit extends Cubit<DropDownMenuState> {
  DropDownMenuCubit() : super(DropDownMenuInitial());

  // لتحديد البطاقة النشطة
  void selectCard(String selectedTitle) {
    emit(CardSelectedState(selectedTitle));
  }

  // لإغلاق القائمة
  void collapseMenu() {
    emit(MenuCollapsedState());
  }
}
