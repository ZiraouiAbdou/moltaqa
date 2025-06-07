part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// Login
final class LoginLoading extends AuthState {}

final class LoginFailed extends AuthState {
  final String error;

  LoginFailed(this.error);
}

final class LoginSuccess extends AuthState {}

// Sign up
final class SignupLoading extends AuthState {}

final class SignupFailed extends AuthState {
  final String error;

  SignupFailed(this.error);
}

final class SignupSuccess extends AuthState {}

// Logout
final class LogoutLoading extends AuthState {}

final class LogoutFailed extends AuthState {
  final String error;

  LogoutFailed(this.error);
}

final class LogoutSuccess extends AuthState {}

// Forgot password
final class ForgotPasswordLoading extends AuthState {}

final class ForgotPasswordFailed extends AuthState {
  final String error;

  ForgotPasswordFailed(this.error);
}

final class ForgotPasswordSuccess extends AuthState {}

// count down
class CountdownUpdated extends AuthState {
  final int remainingSeconds;
  CountdownUpdated(this.remainingSeconds);
}
