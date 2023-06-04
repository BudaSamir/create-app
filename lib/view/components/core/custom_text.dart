import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/color_manager.dart';
import '../../constant/fonts.dart';

//used as any text in project
class CustomText extends StatelessWidget {
  String text;
  Color color;
  FontWeight fontWeight;
  double fontSize;
  TextAlign textAlign;
  double height;
  TextDecoration textDecoration;

  CustomText({
    Key? key,
    required this.text,
    this.color = whiteColor,
    this.fontWeight = FontWeight.w600,
    this.fontSize = textFont16,
    this.textAlign = TextAlign.start,
    this.height = 1.5,
    this.textDecoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr().toString(),
      textAlign: textAlign,
      style: GoogleFonts.poppins(
        decoration: textDecoration,
        decorationThickness: 1.5,
        fontSize: fontSize.sp,
        color: color,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}
