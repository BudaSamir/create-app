import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'dart:io' as io;

import '../../constant/assets.dart';
class PickImage extends StatelessWidget {
  String pickImage;
  Function? deleteImage;
  double rightPaddingForArabic;
  double leftPaddingForEnglish;
  bool centerImage;
  double sizeImage;
  bool deleteIcon;


  PickImage({
    required this.pickImage,
    this.deleteImage,
    this.rightPaddingForArabic = 0,
    this.leftPaddingForEnglish = 0 ,
    this.centerImage = false ,
    this.sizeImage = 25 ,
    this.deleteIcon = false ,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Stack(
        alignment: centerImage?Alignment.center:(EasyLocalization.of(context)!.locale == Locale('en', 'EN')) ?Alignment.bottomLeft :Alignment.bottomRight,
        children: [

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Align(
              alignment: centerImage?Alignment.center :(EasyLocalization.of(context)!.locale == Locale('en', 'EN')) ?Alignment.bottomLeft :Alignment.bottomRight,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox.fromSize(
                      size:  Size.fromRadius(sizeImage),
                      child: Image.file(io.File(pickImage),fit: BoxFit.cover,))),
            ),
          ),

          deleteIcon
          ? const SizedBox() : Padding(
              padding: EdgeInsets.only(left: leftPaddingForEnglish,right:rightPaddingForArabic,bottom: 40.h),

              child: GestureDetector(
                  onTap: () => deleteImage!(),
                  child: SvgPicture.asset(closeSVG)))

        ],

      ),
    );
  }
}
