import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../viewmodel/cubits/users/users_cubit.dart';
class UsersScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var usersCubit = BlocProvider.of<UsersCubit>(context, listen: true);

return Scaffold(
  body: ListView.builder(
    itemCount:usersCubit.userModel.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${usersCubit.userModel[index].title}",
            style: TextStyle(color: Colors.red),

            ),
          ));
    },),

    );
  }
}
