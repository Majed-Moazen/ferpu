import 'package:bloc/bloc.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState(pageIndex: 0));

  void changePageIndex({required int newPageIndex}) {
    emit(state.copyWith(pageIndex: newPageIndex));
  }
}
