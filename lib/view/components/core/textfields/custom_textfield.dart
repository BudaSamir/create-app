import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color_manager.dart';
import '../../../constant/fonts.dart';
import 'custom_border.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String hint;
  Widget? suffixIcon;
  String? Function(String?)? validation;
  FocusNode? focusNode;
  FocusNode? nextTextField;
  Color fillColor;
  Color hintColor;
  int maxLines;
  double fontSize;
  TextInputType textInputType;
  Widget? widget;
  bool? isUnderlineBorder;
  bool? isDense;
  Color? textColor;
  List<TextInputFormatter>? inputFormatters;



  CustomTextField({
    Key? key,
    this.controller,
    required this.hint,
    this.fillColor = transparent,
    this.hintColor = borderColor,
    this.suffixIcon,
    required this.validation,
    this.focusNode,
    this.nextTextField,
    this.maxLines = 1,
    this.fontSize = textFont18,
    this.textInputType = TextInputType.text,
    this.isUnderlineBorder=true,
    this.isDense= false,
    this.textColor = yellowColor,
    this.inputFormatters,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Transform(
      transform: Matrix4.translationValues(0, -10.0, 0),
      child: TextFormField(
          onFieldSubmitted: (value) {
            if (nextTextField != null) {
              FocusScope.of(context).requestFocus(nextTextField);
            } else if (focusNode != null) {
              focusNode!.unfocus();
            }
          },
          validator: validation,
          maxLines: maxLines,
          focusNode: focusNode,
          cursorColor: borderColor,
          controller: controller,
          keyboardType: textInputType,
          style: TextStyle(color: textColor),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              //isDense: true,
              alignLabelWithHint: true,
              filled: true,
              fillColor: fillColor,
              suffixIcon: suffixIcon,
              enabledBorder: customBorder(borderColor),
              focusedBorder: customBorder(borderColor),
              errorBorder: customBorder(redColor),
              focusedErrorBorder: customBorder(redColor),
              hintText: hint.tr().toString(),
              hintStyle: GoogleFonts.poppins(
                  color: hintColor,
                  fontWeight: FontWeight.w500,

                  fontSize: fontSize.sp))),


    );
  }
}
