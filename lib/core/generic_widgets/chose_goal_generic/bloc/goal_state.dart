abstract class GoalState {}

class InitialState extends GoalState {}

class GoalUpdatedState extends GoalState {
  final List<bool> selectedGoals;
  final bool isAnyGoalSelected;

  GoalUpdatedState(this.selectedGoals, this.isAnyGoalSelected);
}
