import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant/color_manager.dart';
import '../../../constant/fonts.dart';
import '../custom_text.dart';

class CustomHoverButton extends StatelessWidget {
  VoidCallback onClick;
  String text;
  Color color;
  double? width;
  double? height;
  double? fontSize;
  double borderRadius;

  CustomHoverButton({Key? key,
    required this.onClick,
    required this.text,
    this.color = primaryColor,
    this.width,
    this.height,
    this.fontSize= btnFont16,
    this.borderRadius= 10,
  })
      : super(key: key);

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()
      {
        onClick();
      },
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: fontSize)),
          fixedSize: MaterialStateProperty.all(Size(width ?? ScreenUtil().screenWidth, height ?? 46.h)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
              )
          ),
          foregroundColor: getColor(lightTextColor,primaryColor),
          backgroundColor: getColor(lightBlueColor, whiteColor),


      ),
      child: Text(
        // text.tr().toString(),
        text,
        textAlign: TextAlign.start,
        style: GoogleFonts.amiri(
            decorationThickness: 1.5,
            fontSize:  btnFont20,
          fontWeight: FontWeight.w600
        ),
    )
    );
  }

  MaterialStateProperty<Color> getColor(Color colorNotPressed, Color colorPressed)
  {
    getColor(Set<MaterialState> states)
    {
      if (states.contains(MaterialState.pressed))
        {
          return colorPressed;
        }

      else
        {
          return colorNotPressed;
        }
    }
    return MaterialStateProperty.resolveWith(getColor);

  }
}
