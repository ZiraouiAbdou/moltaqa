import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moltaqa/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepo;
  AuthCubit(this._authRepo) : super(AuthInitial());

  Future<void> createUser({
    required String email,
    required String password,
    required String userName,
  }) async {
    try {
      emit(SignupLoading());
      await _authRepo.createUser(
        email: email,
        password: password,
        userName: userName,
      );
      emit(SignupSuccess());
    } catch (e) {
      print("cubit auth error: ${e.toString()}");
      emit(SignupFailed(e.toString()));
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      await _authRepo.signIn(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      log("Login error: ${e.toString()}");
      emit(LoginFailed(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      emit(LogoutLoading());
      await _authRepo.signOut();
      emit(LogoutSuccess());
    } catch (e) {
      log("Logout error: ${e.toString()}");
      emit(LogoutFailed(e.toString()));
    }
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      emit(ForgotPasswordLoading());
      await _authRepo.sendPasswordResetEmail(email);
      emit(ForgotPasswordSuccess());
    } catch (e) {
      log("ForgotPassword error: ${e.toString()}");
      emit(ForgotPasswordFailed(e.toString()));
    }
  }

  int resetPasswordCountdown = 0;
  Timer? _countdownTimer;

  void startPasswordResetCountdown() {
    resetPasswordCountdown = 60;
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resetPasswordCountdown > 0) {
        resetPasswordCountdown--;
        emit(CountdownUpdated(resetPasswordCountdown));
      } else {
        _countdownTimer?.cancel();
      }
    });
  }

  @override
  Future<void> close() {
    _countdownTimer?.cancel();
    return super.close();
  }
}
