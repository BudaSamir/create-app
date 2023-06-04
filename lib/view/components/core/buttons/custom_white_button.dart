import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../constant/assets.dart';
import '../../../constant/color_manager.dart';
import '../../../constant/fonts.dart';
import '../custom_text.dart';
import '../space.dart';

class CustomWhiteButton extends StatelessWidget {

  bool calender = false;
  bool enabled = true;
  String text;
  String textBox;
  double fontSize;
  double? width;
  Function onClick;



  CustomWhiteButton({

    required this.calender,
    this.text ="",
    this.enabled = true,
    this.textBox="",
    this.width,
    this.fontSize= textFont16,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        padding: calender
            ? EdgeInsets.symmetric(horizontal: 15.w,vertical: 14.h)
            : EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),

        width: width ?? ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: calender
              ? BorderRadius.circular(6)
              : (EasyLocalization.of(context)!.locale == Locale('ar', 'AR'))
                ? BorderRadius.circular(6)
                : BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween  ,
          children: [
            Expanded(
              child: CustomText(
                text: text.tr().toString(),
                fontSize: (EasyLocalization.of(context)!.locale == Locale('ar', 'AR'))
                    ? fontSize : textFont13,
                color: enabled ? (calender?yellowColor :blackColor) : greyText2Color,
              ),
            ),
            calender
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset(calenderSVG),
            )
            : GestureDetector(
              onTap: ()
              {
                onClick();
              },
              child: Container(
                padding: (EasyLocalization.of(context)!.locale == Locale('ar', 'AR'))?EdgeInsets.only(right: 20.w) :EdgeInsets.only(left: 10.w),
                //width: ScreenUtil().screenWidth,
                decoration:   BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(6),
                    border: Border(
                      top: BorderSide(color: enabled ? primaryColor : greyText2Color,width: 1.5.w),
                      bottom: BorderSide(color: enabled ? primaryColor : greyText2Color,width: 1.5.w),
                      left: BorderSide(color: enabled ? primaryColor : greyText2Color,width: 1.5.w),
                      right: BorderSide(color: enabled ? primaryColor : greyText2Color,width: 1.5.w),
                    )
                ),
                //upload (txt + icon)
                child: Row(
                  children: [

                    //txt upload
                    Padding(
                      padding: (EasyLocalization.of(context)!.locale == Locale('ar', 'AR'))?EdgeInsets.only(left: 20.w) :EdgeInsets.only(right: 10.w),
                      child: CustomText(
                        text: textBox.tr().toString(),
                        fontSize: (EasyLocalization.of(context)!.locale == Locale('ar', 'AR'))
                            ? fontSize
                            : textFont13,
                        color: enabled ? primaryColor : greyText2Color,
                      ),
                    ),

                    //icon upload
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 5.h),
                      //width: ScreenUtil().screenWidth,
                      decoration:  BoxDecoration(
                        color: enabled ? primaryColor : greyText2Color,


                      ),
                      child: Icon(Icons.camera_alt_rounded,color: whiteColor,),
                    )
                  ],
                ),
              ),
            )


          ],
        ),
      ),
    );
  }
}
