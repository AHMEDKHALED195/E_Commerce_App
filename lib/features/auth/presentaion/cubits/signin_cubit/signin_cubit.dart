import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepo authRepo;

  SigninCubit(this.authRepo) : super(SigninInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SigninLoading());
    final failureOrUser = await authRepo.signInWithEmailAndPassword(
      email,
      password,
    );
    return failureOrUser.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (use) => emit(SigninSuccess(userEntity: use)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    final failureOrUser = await authRepo.signInWithGoogle();
    return failureOrUser.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (use) => emit(SigninSuccess(userEntity: use)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    final failureOrUser = await authRepo.signInWithFacebook();
    return failureOrUser.fold(
      (failure) => emit(SigninFailure(message: failure.message)),
      (use) => emit(SigninSuccess(userEntity: use)),
    );
  }
}
