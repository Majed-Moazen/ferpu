import 'package:ferpo/core/generic_widgets/chose_goal_generic/bloc/goal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'chose_age_state.dart';

class AgeCubit extends Cubit<AgeState> {
  AgeCubit() : super(InitialAgeState());

  int? _selectedIndex;

  int? get selectedIndex => _selectedIndex;
  bool get isAgeSelected => _selectedIndex != null;

  void selectAge(int index) {
    _selectedIndex = index;
    emit(AgeUpdatedState(_selectedIndex!, isAgeSelected));
  }
}
