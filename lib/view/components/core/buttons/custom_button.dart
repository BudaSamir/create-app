import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color_manager.dart';
import '../../../constant/fonts.dart';

//used in most of project to make button
class CustomButton extends StatelessWidget {
  void Function()? onClick;
  Widget title;
  Color color;
  double? width;
  double? height;
  double? fontSize;
  double borderRadius;
  Color borderColor;

  CustomButton({
    Key? key,
    required this.onClick,
    required this.title,
    this.color = primaryColor,
    this.width,
    this.height,
    this.fontSize = btnFont16,
    this.borderRadius = 10,
    this.borderColor = transparent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      color: color,
      child: InkWell(
          onTap: onClick,
          child: Container(
            // lw b null hy3ml elly b3d "?", lw msh b null hy3ml elly b3d "?"
            width: width ?? ScreenUtil().screenWidth,
            height: height ?? 46.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor
              )),
            child: Center(
              child: title,
            ),
          )),
    );
  }
}
