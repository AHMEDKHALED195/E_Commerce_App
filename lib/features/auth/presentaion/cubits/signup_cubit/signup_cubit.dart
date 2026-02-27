import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    emit(SignupLoading());
    final failureOrUser = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    return failureOrUser.fold(
      (failure) => emit(SignupFailure(message: failure.message)),
      (use) => emit(SignupSuccess(userEntity: use)),
    );
  }
}
