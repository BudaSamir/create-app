import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//used to make space height
Widget addHeightSpace(double amount)
{
  return SizedBox(height: amount.h,);
}

//used to make space width
Widget addWidthSpace(double amount)
{
  return SizedBox(width: amount.w,);
}
