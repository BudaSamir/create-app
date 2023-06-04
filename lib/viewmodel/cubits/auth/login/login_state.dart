part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  LoginModel loginModel;
  LoginSuccess({
    required this.loginModel,
  });
}
class LoginError extends LoginState {}

class CountryLoading extends LoginState {}
class CountrySuccess extends LoginState {}
class CountryError extends LoginState {}

class ChangeCountry extends LoginState {}

class PasswordShow extends LoginState {}
class RememberMe extends LoginState {}
