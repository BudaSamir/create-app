import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'view/Screens/loginScreen.dart';
import 'view/Screens/userscreen.dart';
import 'view/components/core/buttons/custom_button.dart';
import 'view/components/core/buttons/custom_hover_button.dart';
import 'view/components/core/buttons/custom_white_button.dart';
import 'view/components/core/custom_text.dart';
import 'view/constant/navigation_service.dart';
import 'view/constant/observer.dart';
import 'viewmodel/cubits/auth/login/login_cubit.dart';
import 'viewmodel/cubits/auth/signup/signup_cubit.dart';
import 'viewmodel/cubits/screenshot/screen_shoot_cubit.dart';
import 'viewmodel/cubits/users/users_cubit.dart';
import 'viewmodel/database/local/cache_helper.dart';
import 'viewmodel/database/network/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => UsersCubit()..getpost()),
        BlocProvider(create: (context) => ScreenShootCubit()..disableCapture()),

        // BlocProvider(create: (context) => ForgetPasswordCubit()),
        // BlocProvider(create: (context) => SocketCubit()..socketListener()),
        // BlocProvider(create: (context) => UpdateDetailsCubit()),
        // BlocProvider(create: (context) => PartnerAccountCubit()),
        // BlocProvider(create: (context) => OrderCubit()),
        // BlocProvider(create: (context) => NotificationsCubit()),
        // BlocProvider(create: (context) => ProfileCubit()),
        // BlocProvider(create: (context) => CompanyDetailsSupportCubit()..getCompanyDetails()),
        //BlocProvider(create: (context) => NeedHelpSupportCubit()..getCompaniesSupport())
      ],
      child: EasyLocalization(
        path: "resources/langs",
        supportedLocales: const [
          Locale('en', 'EN'),
          Locale('ar', 'AR'),
        ],
        //fallbackLocale: Locale('en'),
        saveLocale: true,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 811),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.instance.navigationKey,
          routes: {
            // "LoginScreen": (BuildContext context) =>  LoginScreen(),
          },
          title: 'Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen(),
          // home:  UsersScreen(),
        );
      },
    );
  }
}
