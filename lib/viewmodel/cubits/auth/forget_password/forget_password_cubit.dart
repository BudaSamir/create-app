import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../model/auth/forget/forget_password_model.dart';

import '../../../../view/components/core/component.dart';
import '../../../../view/constant/data.dart';
import '../../../database/network/dio_exceptions.dart';
import '../../../database/network/dio_helper.dart';
import '../../../database/network/end_points.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //used to show password
  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    print("show password");
    emit(PasswordShow());
  }

  //used to show confirm password
  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    print("show confirm password");
    emit(ConfirmPasswordShow());
  }

  ForgetPasswordModel? forgetPasswordModel;

  String phone = '';

  //used for send email to reset password
  Future<dynamic> forgetPassword({
    required String phone,
  }) async {
    emit(ForgetPasswordLoading());
    this.phone = phone;
    await DioHelper.postData(url: forgetPasswordEndPoint, data:
    {
      'phone': phone,
      'type': "FREELANCE",
      'country':countryId
    }).then((value) {
     // forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);

      print("=====================data");
      print(value.data);
      print(phone);
      emit(ForgetPasswordSuccess());
    }).catchError((error)
    {
      if (error is DioError)
      {
        print(error.response?.data);
        showToast(message: error.response?.data["errors"]);
        //showToast(message: error.response!.data['message'].toString());
      }
      //onFail();
      emit(ForgetPasswordError());
      throw error;
    });
  }

  //used for get verify otp
  Future<dynamic> forgetPasswordVerifyOTP({
    required String phone,
    required String code}) async {
    this.phone = phone;
    emit(ForgetPasswordConfirmCodeLoading());
    print(phone);
    await DioHelper.putData(url: forgetPasswordConfirmCodeEndPoint,data:
    {
      "phone":phone,
      "code":code,
      "country":countryId,
      "type":"FREELANCE"

    },).then((value) {
     // ForgetPasswordModel.fromJson(value.data);
      print("phone is ----");
      print(phone);
      emit(ForgetPasswordConfirmCodeSuccess());
    }).catchError((error) {
      if (error is DioError) {

        print(error.response?.data);
        showToast(message: error.response?.data["errors"]);
        //showToast(message:  error.response?.data);
       // String meesage = DioExceptions.fromDioError(error).toString();
       // showToast(message: meesage);
      }

      emit(ForgetPasswordConfirmCodeError());

      throw error;
    });
  }

  //used for reset password
  Future<dynamic> createNewPassword({
        required String password,
        required String phone,
        required Function onSuccess}) async {
    this.phone = phone;
    emit(CreateNewPasswordLoading());
    await DioHelper.putData(url: createNewPasswordEndPoint, data: {
      "phone": phone,
      "password": password,
      "type": "FREELANCE",
      "country": countryId,
    }).then((value) {
      //forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);

      emit(CreateNewPasswordSuccess());
    }).catchError((error) {
      if (error is DioError)
      {

        print(error.response?.data);
       showToast(message:error.response?.data["errors"]);
      }
      emit(CreateNewPasswordError());
      throw error;
    });
  }

  // CountryModel? countriesModel;
  // CountryData? countryData;

  //used to get all countries
  // Future<dynamic> getCountries() async {
  //   print("loading countries");
  //   emit(CountryLoading());
  //   DioHelper.getData(
  //     url: countryEndPoint,
  //     token: accessToken,
  //     queryParameters: {
  //       'removeLanguage': true,
  //     },
  //   ).then((value) {
  //     print(value.data);
  //     print("countries ");
  //     // countriesModel = CountryModel.fromJson(value.data);
  //     print(countriesModel == null);
  //     print(value.data["data"][0]["name"]["ar"]);
  //     emit(CountrySuccess());
  //   }).catchError((onError) {
  //     print(onError);
  //     if (onError is DioError) {
  //       String meesage = DioExceptions.fromDioError(onError).toString();
  //       showToast(message: meesage);
  //     }
  //     emit(CountryError());
  //     throw onError;
  //   });
  // }

  String? countryCode = "20";
  String? countryImage =
      "https://www.liurvo.com/fixo-Backend/uploads/country/4b8a2eb1-a288-4559-b042-3c89319cda5c.jpeg";
  int? countryId = 3;

  void changeIcon({required String countryCode, required String countryLogo, required int? countryID}) {
    this.countryCode = countryCode;
    countryImage = "$baseUrl$countryLogo";
    countryId = countryID;
    emit(ChangeCountry());
  }
}
