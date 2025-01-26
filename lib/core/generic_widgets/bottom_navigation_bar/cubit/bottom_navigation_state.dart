part of 'bottom_navigation_cubit.dart';

class BottomNavigationState {
  final int pageIndex;
//  final String? userId;
  final bool isLoading;
  final String? error;

  BottomNavigationState({
    required this.pageIndex,
    //this.userId,
    this.isLoading = false,
    this.error,
  });

  BottomNavigationState copyWith({
    int? pageIndex,
    // String? userId,
    bool? isLoading,
    String? error,
  }) {
    return BottomNavigationState(
      pageIndex: pageIndex ?? this.pageIndex,
      // userId: userId ?? this.userId,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
