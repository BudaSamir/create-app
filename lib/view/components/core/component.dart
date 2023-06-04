import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../constant/color_manager.dart';
import '../../constant/fonts.dart';


Future<bool?> showToast({required String message, Color color = blackColor}) {
  return Fluttertoast.showToast(
    msg: message.tr(),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: textFont14.sp,
  );
}

void navigatorAndRemove(context, Widget screen) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
    (Route<dynamic> route) => false,
  );
}

void navigatorAndRemoveLast(context, Widget screen) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
}

navigator(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigatorPushNamed(context, String screen) {
  Navigator.pushNamed(context, screen);
}
