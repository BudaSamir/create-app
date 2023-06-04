part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}


class PasswordShow extends ForgetPasswordState {}
class ConfirmPasswordShow extends ForgetPasswordState {}


class ForgetPasswordLoading extends ForgetPasswordState {}
class ForgetPasswordSuccess extends ForgetPasswordState {}
class ForgetPasswordError extends ForgetPasswordState {}

class ForgetPasswordConfirmCodeLoading extends ForgetPasswordState {}
class ForgetPasswordConfirmCodeSuccess extends ForgetPasswordState {}
class ForgetPasswordConfirmCodeError extends ForgetPasswordState {}


class CreateNewPasswordLoading extends ForgetPasswordState {}
class CreateNewPasswordSuccess extends ForgetPasswordState {}
class CreateNewPasswordError extends ForgetPasswordState {}


class CountryLoading extends ForgetPasswordState {}
class CountrySuccess extends ForgetPasswordState {}
class CountryError extends ForgetPasswordState {}

class ChangeCountry extends ForgetPasswordState {}
