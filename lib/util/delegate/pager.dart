// Flutter imports:

import 'package:doctoro/presantation/page/auth/forgot_password_page/forgot_pass_page.dart';
import 'package:doctoro/presantation/page/landing_page/landing_page.dart';
import 'package:doctoro/presantation/page/product_page/product_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../presantation/page/auth/register_page/register_page.dart';
import '../../presantation/page/home_page/home_page.dart';

class Pager {
  static get register => Register();

  static get forgot => ForgetPasswordPage();

  static get home => HomePage();
  static get landing => LandingPage();
  static get productPage => ProductPage();
}
