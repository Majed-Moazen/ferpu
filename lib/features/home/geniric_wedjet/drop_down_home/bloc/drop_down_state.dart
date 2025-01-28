abstract class DropDownMenuState {}

class DropDownMenuInitial extends DropDownMenuState {}

class CardSelectedState extends DropDownMenuState {
  final String selectedCard;
  CardSelectedState(this.selectedCard);
}

class MenuCollapsedState extends DropDownMenuState {}
