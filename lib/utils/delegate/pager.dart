// Flutter imports:

import 'package:doctoro/infrastructure/cubit/address/address_cubit.dart';
import 'package:doctoro/infrastructure/cubit/map/map_store_cubit.dart';
import 'package:doctoro/presentation/page/auth/forgot_password_page/forgot_pass_page.dart';
import 'package:doctoro/presentation/page/delivery_address_page/delivery_address_page.dart';
import 'package:doctoro/presentation/page/landing_page/landing_page.dart';
import 'package:doctoro/presentation/page/map_medicine_page/map_medicine_page.dart';
import 'package:doctoro/utils/delegate/my_printer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../app.dart';
import '../../infrastructure/cubit/authentication/authentication_cubit.dart';
import '../../infrastructure/cubit/login/login_cubit.dart';
import '../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../infrastructure/cubit/product_option_cubit/product_option_cubit.dart';
import '../../infrastructure/cubit/register/register_cubit.dart';
import '../../presentation/page/address_page/address_page.dart';
import '../../presentation/page/auth/login_page/login_page.dart';
import '../../presentation/page/auth/register_page/register_page.dart';
import '../../presentation/page/cart_delivery_page/cart_delivery_page.dart';
import '../../presentation/page/cart_page/cart_page.dart';
import '../../presentation/page/change_number/change_number_page.dart';
import '../../presentation/page/contact_page/contact_page.dart';
import '../../presentation/page/home_page/home_page.dart';
import '../../presentation/page/medicine_details_page/medicine_details_page.dart';
import '../../presentation/page/other_page/other_page.dart';
import '../../presentation/page/payment_method_page/payment_method_page.dart';
import '../../presentation/page/product_page/product_page.dart';
import '../../presentation/page/settings_page/settings_page.dart';

class Pager {
  Pager._();

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

  static get cart => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ], child: CartPage());

  static get cartDelivery => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ], child: CartDeliveryPage());

  static get deliveryAddress => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ], child: DeliveryAddressPage());

  static get mapPage => MultiBlocProvider(providers: [
        BlocProvider.value(value: MapStoreCubit()..fetch()),
      ], child: MapPage());

  static get forgot => ForgetPasswordPage();

  static get paymentMethodPage => PaymentMethodPage();

  static get settings => SettingsPage();

  static get changeNumber => ChangeNumberPage();

  static get home => HomePage();

  static get landing => LandingPage();

  static get productPage => ProductPage();

  static get otherPage => OtherPage();

  static get contactPage => ContactPage();

  static get productDetails => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductOptionCubit()..fetchProduct(),
          ),
          BlocProvider(
            create: (context) => ProductOptionDetailsCubit(),
          ),
        ],
        child: MedicineDetailsPage(),
      );

  static get addressPage => BlocProvider(
        create: (context) => AddressCubit()..fetch(),
        child: AddressPage(),
      );
}
