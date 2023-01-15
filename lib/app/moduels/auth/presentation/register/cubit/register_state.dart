part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterRefreshUi extends RegisterState {}
class LogoutWithFacebookSuccess extends RegisterState {}

class RegisterWithGmailLoading extends RegisterState {}

class RegisterWithGmailSuccess extends RegisterState {}

class RegisterWithGmailError extends RegisterState {
  final String message;

  RegisterWithGmailError({required this.message});
}
