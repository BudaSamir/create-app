import 'package:creatapp/view/components/core/space.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/color_manager.dart';
import '../../constant/fonts.dart';
import 'buttons/custom_button.dart';
import 'component.dart';
import 'custom_text.dart';

class HeadFormSingup extends StatelessWidget {
  String headTitle;

  bool isBoxFit;
  BoxFit boxFit;

  bool isCompanies;

  bool isIndividuals;

  bool? isCompaniesNavigator;

  bool? isIndividualsNavigator;

  HeadFormSingup(
      {Key? key,
      this.isCompaniesNavigator = true,
      this.isIndividualsNavigator = true,
      required this.headTitle,
      this.isBoxFit = false,
      this.boxFit = BoxFit.none,
      required this.isCompanies,
      required this.isIndividuals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomText(
          text: "signUp",
          fontSize: textFont32,
          textAlign: TextAlign.center,
        ),
        addHeightSpace(8),
        FittedBox(
          fit: isBoxFit? BoxFit.contain : boxFit,
          child: CustomText(
            text: headTitle,
            fontSize: textFont18,
            textAlign: TextAlign.center,
          ),
        ),
        addHeightSpace(10),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomButton(
                  title: CustomText(
                    text: "companies",
                    color: isCompanies ? primaryColor : whiteColor,
                  ),
                  onClick: () {
                    // isCompaniesNavigator!
                    //     ? navigatorAndRemoveLast(context, FormCompaniesSignupScreen())
                    //     : null;
                  },
                  color: isCompanies ? whiteColor : borderColorTwo,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomButton(
                  title: CustomText(
                    text: "individuals",
                    color: isIndividuals ? primaryColor : whiteColor,
                  ),
                  onClick: () {
                    // isCompaniesNavigator!
                    //     ? navigatorAndRemoveLast(context, FormPersonSignupScreen())
                    //     : null;
                  },
                  color: isIndividuals ? whiteColor : borderColorTwo,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
