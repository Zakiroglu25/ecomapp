// Flutter imports:

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/address/address_cubit.dart';
import 'package:uikit/infrastructure/cubit/chat_messages_cubit/chat_messenger_cubit.dart';
import 'package:uikit/infrastructure/cubit/faq_cubit/faq_cubit.dart';
import 'package:uikit/infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import 'package:uikit/infrastructure/cubit/map/map_store_cubit.dart';
import 'package:uikit/infrastructure/cubit/order_info/index.dart';
import 'package:uikit/infrastructure/cubit/otp/otp_cubit.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/forgot_pass_page.dart';
import 'package:uikit/presentation/page/auth/otp_page/otp_page.dart';
import 'package:uikit/presentation/page/cart_order_details_page/cart_order_details_page.dart';
import 'package:uikit/presentation/page/delivery_and_payment_page/delivery_and_payment_page.dart';
import 'package:uikit/presentation/page/landing_page/landing_page.dart';
import 'package:uikit/presentation/page/map_medicine_page/map_medicine_page.dart';
import 'package:uikit/presentation/page/notification_page/notifications_page.dart';

import '../../app.dart';
import '../../infrastructure/cubit/add_address/add_and_update_address_cubit.dart';
import '../../infrastructure/cubit/authentication/authentication_cubit.dart';
import '../../infrastructure/cubit/card_cubit/card_cubit.dart';
import '../../infrastructure/cubit/cart/cart_cubit.dart';
import '../../infrastructure/cubit/contact_cubit/contact_cubit.dart';
import '../../infrastructure/cubit/favorite_cubit/favorite_cubit.dart';
import '../../infrastructure/cubit/login/login_cubit.dart';
import '../../infrastructure/cubit/messenger_cubit/messenger_cubit.dart';
import '../../infrastructure/cubit/notification_cubit/notification_cubit.dart';
import '../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../infrastructure/cubit/product_option_cubit/product_option_cubit.dart';
import '../../infrastructure/cubit/register/register_cubit.dart';
import '../../infrastructure/cubit/tab_counts/tab_counts_cubit.dart';
import '../../infrastructure/cubit/user/user_cubit.dart';
import '../../infrastructure/cubit/waiting_orders/waiting_orders_cubit.dart';
import '../../infrastructure/model/response/address_model.dart';
import '../../presentation/page/add_address_page/add_address_page.dart';
import '../../presentation/page/address_page/address_page.dart';
import '../../presentation/page/auth/login_page/login_page.dart';
import '../../presentation/page/auth/register_page/register_page.dart';
import '../../presentation/page/cart_page/cart_page.dart';
import '../../presentation/page/change_number/change_number_page.dart';
import '../../presentation/page/contact_page/contact_page.dart';
import '../../presentation/page/favorite_page/favorite_page.dart';
import '../../presentation/page/home_page/home_page.dart';
import '../../presentation/page/medicines_page/medicines_page.dart';
import '../../presentation/page/messenger_page/messenger_page.dart';
import '../../presentation/page/messenger_page/widget/chat_details.dart';
import '../../presentation/page/other_page/other_page.dart';
import '../../presentation/page/payment_method_page/payment_method_page.dart';
import '../../presentation/page/product_details_page/product_details_page.dart';
import '../../presentation/page/product_page/product_page.dart';
import '../../presentation/page/question_response_page/question_response_page.dart';
import '../../presentation/page/settings_page/settings_page.dart';
import '../../presentation/page/splash_page/splash_page.dart';
import '../../presentation/page/user_edit_page/user_edit_page.dart';

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

  static get medicines => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => ProductOptionCubit()..fetchProduct()),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => AddressCubit()..fetchMainAddress()),
      ], child: const MedicinesPage());

  static get cart => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => CartCubit()..fetch()),
        BlocProvider(create: (context) => WaitingOrdersCubit()..fetch()),
        BlocProvider(create: (context) => TabCountsCubit()..fetch()),
      ], child: CartPage());

  static cartOrderDetails(
    String guid, {
    required int orderNumber,
    required String status,
  }) =>
      MultiBlocProvider(providers: [
        BlocProvider(create: (context) => OrderInfoCubit()..fetch(guid: guid)),
      ], child: CartOrderDetailsPage(orderNumber: orderNumber, status: status));

  static get splash => SplashPage();

  static get mapPage => MultiBlocProvider(providers: [
        BlocProvider.value(value: MapStoreCubit()..fetch()),
      ], child: MapPage());

  static get userEdit => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: const UserEditPage());

  static get editNum => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => UserCubit())],
      child: const UserEditPage());

  static otp({
    bool requestNew = false,
    bool showBackButton = true,
  }) =>
      MultiBlocProvider(providers: [
        BlocProvider(create: (context) => OTPCubit(requestNew: requestNew))
      ], child: OTPPage(showBackButton: showBackButton));

  static get forgotPassword => MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ForgotPassCubit())],
      child: const ForgetPasswordPage());

  static get paymentMethodPage => BlocProvider(
        create: (context) => CardCubit()..getCard(),
        child: PaymentMethodPage(),
      );

  static get notificationPage => BlocProvider(
        create: (context) => NotificationCubit()..getNotification(),
        child: NotificationsPage(),
      );

  static get faqPage => BlocProvider(
        create: (context) => FaqCubit()..getFaq(),
        child: AnswerQuestionPage(),
      );

  static get settings => SettingsPage();

  static get changeNumber => BlocProvider(
        create: (context) => UserCubit(),
        child: ChangeNumberPage(),
      );

  static get home => HomePage();

  static get messenger => BlocProvider(
        create: (context) => MessengerCubit(),
        child: MessengerPage(),
      );

  static get landing => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AddressCubit()),
      ], child: const LandingPage());

  static get product => ProductPage();

  static chat({String? guid, String? storeName}) => BlocProvider(
        create: (context) => ChatMessengerCubit(),
        child: Chat(guid, storeName),
      );

  static addAddress({Address? address}) => BlocProvider(
        create: (context) => AddAddressCubit(),
        child: AddAddressPage(),
      );

  static get otherPage => OtherPage();

  static get contactPage => BlocProvider(
        create: (context) => ContactCubit()..fetch(),
        child: ContactPage(),
      );

  static get favoritePage => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FavoriteCubit()..fetchProduct()),
          BlocProvider(create: (context) => CartCubit()),
        ],
        child: FavoritePage(),
      );

  static productDetails({required String guid}) =>
      MultiBlocProvider(providers: [
        BlocProvider(
            create: (context) =>
                ProductOptionDetailsCubit()..fetchProduct(guid)),
        BlocProvider(create: (context) => CartCubit())
      ], child: ProductOptionDetails());

  static get addressPage => BlocProvider(
        create: (context) => AddressCubit()..fetch(),
        child: AddressPage(),
      );

  static get orderConfirm => BlocProvider(
        create: (context) => AddressCubit()..fetch(),
        child: AddressPage(),
      );

  static get deliveryAndPaymentPage => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AddressCubit()..fetch(),
          ),
          BlocProvider(create: (context) => CardCubit()..getCard()),
        ],
        child: DeliveryAndPaymentPage(),
      );
}
