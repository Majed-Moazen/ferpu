import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileUpdated(isDarkMode: false, profileImage: null));

  // تبديل وضع الظلام
  void toggleDarkMode() {
    final currentState = state as ProfileUpdated;
    emit(ProfileUpdated(
        isDarkMode: !currentState.isDarkMode,
        profileImage: currentState.profileImage));
  }

  // اختيار صورة من المعرض
  Future<void> pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final currentState = state as ProfileUpdated;
      emit(ProfileUpdated(
          isDarkMode: currentState.isDarkMode,
          profileImage: File(pickedFile.path)));
    }
  }
}
