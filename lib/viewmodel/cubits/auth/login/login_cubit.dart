import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


import '../../../../model/auth/login/login_model.dart';
import '../../../../model/auth/user_model.dart';
import '../../../../view/components/core/component.dart';
import '../../../../view/constant/data.dart';
import '../../../database/local/cache_helper.dart';
import '../../../database/local/keys.dart';
import '../../../database/network/dio_helper.dart';
import '../../../database/network/end_points.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);


  TextEditingController phoneNumberController = TextEditingController()..text = CacheHelper.get(key: 'phone') ?? '';
  TextEditingController passwordController = TextEditingController()..text = CacheHelper.get(key: 'password') ?? '';

  bool isPasswordVisible = true;
  bool rememberMe = false;


  LoginModel? loginModel;


  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    print("show password");
    emit(PasswordShow());
  }

  void rememberMeFunction (value)
  {
    rememberMe = value;
    emit(RememberMe());
  }

  //used for login
  Future<dynamic> userLogin({
    required String phone,
    required String password,
    required int country,
    required Function(String) onFail
    }) async {
    print("value.data");
    emit(LoginLoading());
    DioHelper.postData(url: loginEndPoint, data:
    {
      'phone': phone,
      'password': password,
      'type': "FREELANCE",
      'country':country
    }
    ).then((value) {
      log('User Login -----> ${jsonEncode(value.data)}');
      loginModel = LoginModel.fromJson(value.data);
      print('Kareem');
      user = UserModel.fromJson(value.data);
      CacheHelper.put(key: Keys.userId, value: user?.user?.id);
      print(CacheHelper.get(key: Keys.userId));
     print(loginModel!.accessToken);
      CacheHelper.put(key: accessTokenKey, value: loginModel!.accessToken);
      CacheHelper.put(key: accessTokenKey, value: loginModel!.accessToken).then((value)
      {
        print("jkj");
        //user = loginModel!.data!.user;
        print(user);
        accessToken = loginModel!.accessToken ?? '';
        print(accessToken);
        CacheHelper.put(key: accessTokenKey, value: accessToken);
      //  onSuccess();
      });
      emit(LoginSuccess(loginModel: loginModel!));
    }).catchError((error) {
      if (error is DioError)
      {
        String message = "Something went wrong";
        if (error.message!.contains("SocketException")) {
          message = 'No internet connection';
        }
        else if (error.message!.contains("Http status error [400]")) {
          message = "Email or password is not correct";
        }
        else if (error.message!.contains("Http status error [403]")) {
          message = "This account doesn't exits";
        }
        print(error.response?.data['message']);
        //showToast(message: error.response!.data['message'].toString());
        onFail(message);
      }
      print(error);
      emit(LoginError());
      throw error;
    });
  }

  // CountryModel? countriesModel;
  // CountryData? countryData;
  //
  //
  // //used to get all countries
  // Future<dynamic> getCountries() async {
  //   print("loading countries");
  //   emit(CountryLoading());
  //   DioHelper.getData(url: countryEndPoint, token: CacheHelper.get(key: accessTokenKey), queryParameters: {
  //     'removeLanguage' : true,
  //   },).then((value)
  //   {
  //     print(value.data);
  //     print("countries ");
  //     countriesModel = CountryModel.fromJson(value.data);
  //    //  print(countriesModel == null);
  //    // print(value.data["data"][0]["name"]["ar"]);
  //     emit(CountrySuccess());
  //
  //   }).catchError((onError) {
  //     print(onError);
  //     if (onError is DioError) {
  //       print(onError.response?.data['message'].toString());
  //       showToast(message: onError.response?.data['message'].toString() ?? '');
  //     }
  //     emit(CountryError());
  //   });
  // }
  //
  //
  //
  //
  // String? countryCode = "20";
  // String? countryImage="https://www.liurvo.com/fixo-Backend/uploads/country/4b8a2eb1-a288-4559-b042-3c89319cda5c.jpeg";
  // int? countryId = 5 ;
  //
  // void changeIcon({required String countryCode, required String countryLogo, required int? countryID})
  // {
  //   this.countryCode = countryCode;
  //   countryImage = "$baseUrl$countryLogo";
  //   countryId = countryID;
  //   emit(ChangeCountry());
  // }




}
