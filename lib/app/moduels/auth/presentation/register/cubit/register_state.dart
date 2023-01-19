part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterRefreshUi extends RegisterState {}
class LogoutWithFacebookSuccess extends RegisterState {}

class RegisterLoading extends RegisterState {}
class RegisterWithFaceBookSuccess extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});
}
