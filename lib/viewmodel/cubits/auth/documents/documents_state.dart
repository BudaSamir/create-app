
import 'package:flutter/cupertino.dart';

@immutable
abstract class DocumentsState {}

class SignupInitial extends DocumentsState {}


class NationalityLoading extends DocumentsState {}
class NationalitySuccess extends DocumentsState {}
class NationalityError extends DocumentsState {}

class CityLoading extends DocumentsState {}
class CitySuccess extends DocumentsState {}
class CityError extends DocumentsState {}


class PersonalPictureCancel extends DocumentsState {}
class PersonalPictureSuccess extends DocumentsState {}
class PersonalPictureError extends DocumentsState {}


class CompanyTradeLicenseCancel extends DocumentsState {}
class CompanyTradeLicenseSuccess extends DocumentsState {}
class CompanyTradeLicenseError extends DocumentsState {}


class ProblemBeforeCancel extends DocumentsState {}
class ProblemBeforeSuccess extends DocumentsState {}
class ProblemBeforeError extends DocumentsState {}

class FrontIDCancel extends DocumentsState {}
class FrontIDSuccess extends DocumentsState {}
class FrontIDError extends DocumentsState {}

class BackIDCancel extends DocumentsState {}
class BackIDSuccess extends DocumentsState {}
class BackIDError extends DocumentsState {}

class PassportCancel extends DocumentsState {}
class PassportSuccess extends DocumentsState {}
class PassportError extends DocumentsState {}

class AccommodationCancel extends DocumentsState {}
class AccommodationSuccess extends DocumentsState {}
class AccommodationError extends DocumentsState {}





class DeletePersonalPicture extends DocumentsState {}
class DeleteCompanyTradeLicense extends DocumentsState {}
class DeleteProblemBefore extends DocumentsState {}
class DeleteFrontID extends DocumentsState {}
class DeleteBackID extends DocumentsState {}
class DeletePassport extends DocumentsState {}
class DeleteAccommodation extends DocumentsState {}


class ChangedManagerExpiredCompanyTrade extends DocumentsState {}
class ChangedExpiredID extends DocumentsState {}
class ChangedExpiredPassport extends DocumentsState {}
class ChangedExpiredDateAccommodation extends DocumentsState {}


class ChangeLunchCheckBox extends DocumentsState {}