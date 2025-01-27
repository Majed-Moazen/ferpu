import 'package:ferpo/core/generic_widgets/chose_goal_generic/bloc/goal_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoalCubit extends Cubit<GoalState> {
  GoalCubit()
      : super(GoalUpdatedState(
            [false, false, false], false)); // إرسال حالة ابتدائية

  final List<bool> _selectedGoals = [false, false, false];

  List<bool> get selectedGoals => List.unmodifiable(_selectedGoals);
  bool get isAnyGoalSelected => _selectedGoals.contains(true);

  void toggleGoal(int index) {
    _selectedGoals[index] = !_selectedGoals[index];
    emit(GoalUpdatedState(
        _selectedGoals, isAnyGoalSelected)); // إرسال الحالة المحدثة
  }
}
