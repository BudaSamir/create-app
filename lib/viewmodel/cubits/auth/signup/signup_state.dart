
abstract class SignupState  {}

class InitSignupState extends SignupState {}



class VerifyPhoneSignupLoading extends SignupState {}
class VerifyPhoneSignupSuccess extends SignupState {}
class VerifyPhoneSignupError extends SignupState {}


class VerifyOtpSignupLoading extends SignupState {}
class VerifyOtpSignupSuccess extends SignupState {}
class VerifyOtpSignupError extends SignupState {}

class SignupLoadingState extends SignupState {}
class SignupSuccessState extends SignupState {}
class SignupErrorState extends SignupState {}

class ClearPersonSignup extends SignupState {}
class ClearCompanySignup extends SignupState {}

class ChangeSelectedDateState extends SignupState {}
class ChangeLunchCheckBox extends SignupState {}


class PasswordChangeState extends SignupState  {}
class ConfirmPasswordChangeState extends SignupState  {}
class CheckBoxChangeState extends SignupState  {}


class CountryLoading extends SignupState {}
class CountrySuccess extends SignupState {}
class CountryError extends SignupState {}

class SignupCityLoading extends SignupState {}
class SignupCitySuccess extends SignupState {}
class SignupCityError extends SignupState {}

class SignupNationalityLoading extends SignupState {}
class SignupNationalitySuccess extends SignupState {}
class SignupNationalityError extends SignupState {}

class MainServiceLoading extends SignupState {}
class MainServiceSuccess extends SignupState {}
class MainServiceError extends SignupState {}

class SaveMainService extends SignupState {}

class ChangeCountry extends SignupState {}
class ChangeCity extends SignupState {}

class ItemListCity extends SignupState {}
