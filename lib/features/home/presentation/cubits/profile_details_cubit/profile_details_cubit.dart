import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/services/shared_prefrences_singelton.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';

part 'profile_details_state.dart';

class ProfileDetailsCubit extends Cubit<ProfileDetailsState> {
  ProfileDetailsCubit(this.authRepo) : super(ProfileDetailsInitial());

  final AuthRepo authRepo;

  UserModel getCachedUserData() {
    var jsonData = Prefs.getString(kUserData);
    return UserModel.fromJson(jsonDecode(jsonData));
  }

  Future<void> saveChanges({
    required String newName,
    String? currentPassword,
    String? newPassword,
  }) async {
    emit(ProfileDetailsSaveLoading());
    try {
      // 1) تحديث الاسم في Firestore والكاش
      var currentUser = getCachedUserData();
      var updatedUser = UserEntity(
        email: currentUser.email,
        uId: currentUser.uId,
        displayName: newName,
      );
      await authRepo.addUserData(user: updatedUser);
      await authRepo.saveUserData(user: updatedUser);

      // 2) تغيير كلمة المرور لو المستخدم دخلها
      if (currentPassword != null &&
          currentPassword.isNotEmpty &&
          newPassword != null &&
          newPassword.isNotEmpty) {
        var result = await authRepo.changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );

        var failureMessage = result.fold(
          (failure) => failure.message,
          (_) => null,
        );

        if (failureMessage != null) {
          emit(ProfileDetailsSaveFailure(failureMessage));
          return;
        }
      }

      emit(ProfileDetailsSaveSuccess());
    } catch (e) {
      emit(ProfileDetailsSaveFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى.'));
    }
  }
}
