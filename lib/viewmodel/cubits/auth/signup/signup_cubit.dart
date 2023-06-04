import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/auth/signup/signup_model.dart';
import '../../../../view/components/core/component.dart';
import '../../../database/local/cache_helper.dart';
import '../../../database/network/dio_helper.dart';
import '../../../database/network/end_points.dart';
import '../documents/documents_cubit.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(InitSignupState());

  static SignupCubit get(context) => BlocProvider.of(context);

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isAgreeTerms = false;
  bool isPasswordCharacters = false;
  bool hasPasswordNumber = false;
  bool hasEmailValid = false;

  TextEditingController companyNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController familyNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController bankAccountHolderNameController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController ibanAccountController = TextEditingController();

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    print("show password");
    emit(PasswordChangeState());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    print("show confirm password");
    emit(ConfirmPasswordChangeState());
  }

  String phone = '';

  //used for send email to reset password
  Future<dynamic> verifyPhoneSignup({
    required String phone,
  }) async {
    emit(VerifyPhoneSignupLoading());
    this.phone = phone;
    await DioHelper.postData(
        url: verifyPhoneSignupEndPoint,
        data: {'phone': phone, 'type': "FREELANCE", 'country': "countryId"}).then((value) {
      // forgetPasswordModel = ForgetPasswordModel.fromJson(value.data);

      print("=====================data");
      print(value.data);
      print(phone);
      emit(VerifyPhoneSignupSuccess());
    }).catchError((error) {
      if (error is DioError) {
        print(error.response?.data);
        showToast(message: error.response?.data["errors"]);
        //showToast(message: error.response!.data['message'].toString());
      }
      //onFail();
      emit(VerifyPhoneSignupError());
      throw error;
    });
  }

  //used for get verify otp
  Future<dynamic> verifyOTPSignup({required String phone, required String code}) async {
    this.phone = phone;
    emit(VerifyOtpSignupLoading());
    print(phone);
    await DioHelper.putData(
      url: verifyOtpPhoneSignupEndPoint,
      data: {"phone": phone, "code": code, "country": "countryId", "type": "FREELANCE"},
    ).then((value) {
      // ForgetPasswordModel.fromJson(value.data);
      print("phone is ----");
      print(phone);
      emit(VerifyOtpSignupSuccess());
    }).catchError((error) {
      if (error is DioError) {
        print(error.response?.data);
        showToast(message: error.response?.data["errors"]);
        //showToast(message:  error.response?.data);
        // String meesage = DioExceptions.fromDioError(error).toString();
        // showToast(message: meesage);
      }

      emit(VerifyOtpSignupError());

      throw error;
    });
  }

  SignupModel? signupModel;

  Map<String, dynamic> testJson = {
    "companyName": "Kareem",
    "firstName": "Ahmed",
    "lastName": "Helmy",
    "phone": "1556155978",
    "country": 3,
    "email": "Ka8eem@gmail.com",
    "city": 2,
    "nationality": 3,
    "password": "Admin@123",
    "type": "FREELANCE",
    "personalImage": "/uploads/product/5f3253e5-7f2d-4bc6-939a-f61270268a03.jpg",
    "commecrialImage": "/uploads/product/426cdfee-1016-42ce-9f08-7708d4d8087f.jpg",
    "commecrialEndDate": "2023-04-30 00:00:00.000",
    "frontIdImage": "/uploads/product/18970eec-8ddc-4235-9cb2-a1e0a2682edb.jpg",
    "backIdImage": "/uploads/product/d1121a4e-97bc-4e42-b4bf-cdd34a31312a.jpg",
    "idEndDate": "2023-04-29 00:00:00.000",
    "passportImage": "/uploads/product/444b80b7-564a-49b0-97c3-5b94d6d28446.jpg",
    "passportEndDate": "2023-04-28 01:00:00.000",
    "stay": "/uploads/product/9cc83e09-d830-4071-95b1-6f827ca8614e.jpg",
    "stayEndDate": "2023-04-27 00:00:00.000",
    "mainService": [11, 12, 13, 14, 15, 16, 17],
    "bankAccountUserName": "Kareem Ahmed Helmy",
    "bankAccount": "123123123123",
    "bankName": "QNB",
    "ibanAccount": "123123123123123123123",
  };







  String personalImage = '';
  String commecrialImage = '';
  String frontIdImage = '';
  String backIdImage = '';
  String passportImage = '';
  String stayImage = '';


}
