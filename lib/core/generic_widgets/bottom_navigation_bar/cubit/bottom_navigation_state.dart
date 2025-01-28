part of 'bottom_navigation_cubit.dart';

class BottomNavigationState {
  final int pageIndex;

  BottomNavigationState({required this.pageIndex});

  BottomNavigationState copyWith({int? pageIndex}) {
    return BottomNavigationState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
