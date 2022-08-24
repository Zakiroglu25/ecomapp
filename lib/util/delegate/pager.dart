// Flutter imports:

import 'package:doctoro/presantation/page/auth/forgot_password_page/forgot_pass_page.dart';
import 'package:doctoro/presantation/page/landing_page/landing_page.dart';
import 'package:doctoro/presantation/page/product_page/product_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app.dart';
import '../../infrastructure/cubit/authentication/authentication_cubit.dart';
import '../../infrastructure/cubit/login/login_cubit.dart';
import '../../infrastructure/cubit/register/register_cubit.dart';
import '../../presantation/page/auth/login_page/login_page.dart';
import '../../presantation/page/auth/register_page/register_page.dart';
import '../../presantation/page/home_page/home_page.dart';

class Pager {
  static app({bool? showSplash}) => BlocProvider(
      create: (context) => AuthenticationCubit()
        ..startApp(context, showSplash: showSplash ?? true),
      child: const App());

  static get register => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ], child: Register());

  static get login => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ], child: const LoginPage());


  static get forgot => ForgetPasswordPage();

  static get home => HomePage();

  static get landing => LandingPage();

  static get productPage => ProductPage();
}
