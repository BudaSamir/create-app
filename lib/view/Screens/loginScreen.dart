import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../viewmodel/cubits/auth/login/login_cubit.dart';
import '../../viewmodel/cubits/screenshot/screen_shoot_cubit.dart';
import '../components/core/buttons/custom_button.dart';
import '../components/core/custom_text.dart';
import '../components/core/textfields/custom_text_form_filed.dart';
import '../components/core/textfields/custom_textfield.dart';
import '../constant/color_manager.dart';
import '../constant/data.dart';
import '../constant/fonts.dart';
import '../constant/navigation_service.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var loginCubit = BlocProvider.of<LoginCubit>(context, listen: true);
     BlocProvider.of<ScreenShootCubit>(context, listen: true);

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: SvgPicture.asset(
                'assets/images/2.svg',
                height: MediaQuery.of(context).size.height / 10.0,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                        ),
                        SvgPicture.asset(
                          'assets/images/Logo.svg',
                          semanticsLabel: ' Logo',
                          height: MediaQuery.of(context).size.height / 20.0,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        CustomText(
                          text: 'Login',
                          fontSize: 20,
                          color: BlackArrowBack,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 25,
                        ),
                        TextFormFieldsCustom(
                          controller: emailController,
                          hintText: "email",
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return "email must be not Empty";
                            } else if (!RegExp(validationEmail)
                                .hasMatch(value.trim())) {
                              return "email is not Valid";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormFieldsCustom(
                            controller: passwordController,
                            enableInteractive: false,
                            hintText: "Password",
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            isPassword: loginCubit.isPasswordVisible,
                            // suffixIcon: authCubit.isPassword ?Icons.remove_red_eye:Icons.visibility_off,
                            suffixIcon: loginCubit.isPasswordVisible
                                ? GestureDetector(
                                    onTap: () {
                                      loginCubit.changePasswordVisibility();
                                    },
                                    child: Icon(
                                      Icons.visibility_off,
                                      color: graydot,
                                      size: textFont22,
                                    ))
                                : GestureDetector(
                                    onTap: () {
                                      loginCubit.changePasswordVisibility();
                                    },
                                    child: Icon(
                                      Icons.remove_red_eye,
                                      color: orange,
                                      size: textFont22,
                                    )),
                            suffix: true,

                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Password must be not Empty";
                              } else if (!value
                                  .trim()
                                  .contains(RegExp(r'[A-Z]'))) {
                                return "Password must Contains UpperCase Letter";
                              } else if (!value
                                  .trim()
                                  .contains(RegExp(r'[0-9]'))) {
                                return "Password must Contains Digit";
                              } else if (!value
                                  .trim()
                                  .contains(RegExp(r'[a-z]'))) {
                                return "Password must Contains LowerCase Letter";
                              } else if (!value.trim().contains(
                                  RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                                return "Password must Contains Special Character";
                              } else if (value.trim().length < 8) {
                                return "Password must be more 8 Letters";
                              } else if (!RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$')
                                  .hasMatch(value.trim())) {
                                return "Password is not Valid";
                              }
                              return null;
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: orange,
                                  decoration: TextDecoration.underline,
                                  fontSize: 12),
                            ),
                            onPressed: () {
                              NavigationService
                                  .instance.navigationKey!.currentState!
                                  .pushNamed("ForgetPasswordScreen");
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 90,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 15,
                          child: CustomButton(
                            borderRadius: 7,
                            color: orange,
                            onClick: () {
                              if (formKey.currentState!.validate()) {
                                print("objectvald");
                                NavigationService
                                    .instance.navigationKey!.currentState!
                                    .pushNamed("CategoryScreen");
                              }
                            },
                            title: CustomText(
                              text: 'Login',
                              fontSize: textFont16,
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: BlackArrowBack,
                                fontSize: 14,
                              ),
                              children: <TextSpan>[
                                const TextSpan(
                                  text: "Don't Have an account? ",
                                ),
                                TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                      color: orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        NavigationService.instance
                                            .navigationKey!.currentState!
                                            .pushNamed(
                                          "SignupScreen",
                                        );
                                      }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.bottomStart,
              child: SvgPicture.asset(
                'assets/images/1.svg',
                height: MediaQuery.of(context).size.height / 10.0,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
