import 'dart:ui';

import 'package:flutter/material.dart';

import '../../constant/color_manager.dart';



//used to make blur loading screen in most of screen such as : login , forget_password pass .. etc
class BlurLoading extends StatelessWidget {
  const BlurLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: transparent,
      height: 100,
      width: 100,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Card(
          color: Colors.black.withOpacity(0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: CircularProgressIndicator(
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
