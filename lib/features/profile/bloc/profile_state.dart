import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object?> get props => [];
}

// الحالة الأولية
class ProfileInitial extends ProfileState {}

// حالة عند تحديث البيانات (الوضع الداكن أو الصورة)
class ProfileUpdated extends ProfileState {
  final bool isDarkMode;
  final File? profileImage;

  const ProfileUpdated({required this.isDarkMode, this.profileImage});

  @override
  List<Object?> get props => [isDarkMode, profileImage];
}
