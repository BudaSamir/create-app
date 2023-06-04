import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

import 'screen_shoot_state.dart';



class ScreenShootCubit extends Cubit<ScreenShotsState> {
  ScreenShootCubit() : super(ScreenShotsInitial());
  static ScreenShootCubit get(context) => BlocProvider.of<ScreenShootCubit>(context);

  Future<void> disableCapture() async {
    print("ScreenShoot");
    //disable screenshots and record screen in current screen
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
 emit(ScreenShotsSuccess());
  }
}
