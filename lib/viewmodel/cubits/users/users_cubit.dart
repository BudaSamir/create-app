import 'package:bloc/bloc.dart';
import 'package:creatapp/viewmodel/cubits/users/users_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/UserModel.dart';
import '../../../view/components/core/component.dart';
import '../../../view/constant/color_manager.dart';
import '../../database/network/dio_helper.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());
  List<UserModel> userModel=[];

  static UsersCubit get(context) => BlocProvider.of<UsersCubit>(context);

  void getpost() {
    emit(UsersLoading());

    DioHelper.getData(url: "https://jsonplaceholder.typicode.com/posts")
        .then((value) {
      print("value -------->");
      print(value);
      value.data.forEach((element) {
        print("forEach --------> $element");

        userModel.add(UserModel.fromJson(element));
        print("element -------->");
        print(element);
      });
      emit(UsersSuccess());
    }).catchError((onError) {
      print(onError);
      if (onError is DioError) {
        print('Error Mute Or UnMute Notification');
        print(onError.response?.data);
        showToast(
          message:
              'Error Mute Or UnMute Notification ${onError.response?.data.toString()}',
          color: redColor,
        );
      }
      emit(UsersError());
    });
  }
}
