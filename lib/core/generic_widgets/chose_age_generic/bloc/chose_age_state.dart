abstract class AgeState {}

class InitialAgeState extends AgeState {}

class AgeUpdatedState extends AgeState {
  final int selectedIndex;
  final bool isAgeSelected;

  AgeUpdatedState(this.selectedIndex, this.isAgeSelected);
}
