// Flutter imports:

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/address/address_cubit.dart';
import 'package:uikit/infrastructure/cubit/chat_messages_cubit/chat_messenger_cubit.dart';
import 'package:uikit/infrastructure/cubit/delivery_orders/index.dart';
import 'package:uikit/infrastructure/cubit/faq_cubit/faq_cubit.dart';
import 'package:uikit/infrastructure/cubit/forgot_pass/forgot_pass_cubit.dart';
import 'package:uikit/infrastructure/cubit/map/map_store_cubit.dart';
import 'package:uikit/infrastructure/cubit/order_info/index.dart';
import 'package:uikit/infrastructure/cubit/otp/otp_cubit.dart';
import 'package:uikit/infrastructure/model/response/map_medicine.dart';
import 'package:uikit/presentation/page/auth/forgot_password_page/forgot_pass_page.dart';
import 'package:uikit/presentation/page/auth/otp_page/otp_page.dart';
import 'package:uikit/presentation/page/cart_order_details_page/cart_order_details_page.dart';
import 'package:uikit/presentation/page/landing_page/landing_page.dart';
import 'package:uikit/presentation/page/map_details_page/map_details_page.dart';
import 'package:uikit/presentation/page/map_medicine_page/map_medicine_page.dart';
import 'package:uikit/presentation/page/notification_page/notifications_page.dart';
import 'package:uikit/presentation/page/webview_page/webview_page.dart';
import 'package:uikit/test/test2.dart';
import 'package:uikit/test/test_for_cubit.dart';

import '../../app.dart';
import '../../infrastructure/cubit/add_address/add_and_update_address_cubit.dart';
import '../../infrastructure/cubit/authentication/authentication_cubit.dart';
import '../../infrastructure/cubit/card_cubit/card_cubit.dart';
import '../../infrastructure/cubit/cart/cart_cubit.dart';
import '../../infrastructure/cubit/contact_cubit/contact_cubit.dart';
import '../../infrastructure/cubit/delivery_and_payment/delivery_and_payment_cubit.dart';
import '../../infrastructure/cubit/favorite_cubit/favorite_cubit.dart';
import '../../infrastructure/cubit/insurance_cubit/insurance_cubit.dart';
import '../../infrastructure/cubit/login/login_cubit.dart';
import '../../infrastructure/cubit/messenger_cubit/messenger_cubit.dart';
import '../../infrastructure/cubit/notification_cubit/notification_cubit.dart';
import '../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../infrastructure/cubit/products_cubit/index.dart';
import '../../infrastructure/cubit/register/register_cubit.dart';
import '../../infrastructure/cubit/tab_counts/tab_counts_cubit.dart';
import '../../infrastructure/cubit/user/user_cubit.dart';
import '../../infrastructure/cubit/waiting_orders/waiting_orders_cubit.dart';
import '../../infrastructure/model/response/address_model.dart';
import '../../presentation/page/add_address_page/add_address_page.dart';
import '../../presentation/page/add_asan_insurance_info/add_asan_insurance_info_page.dart';
import '../../presentation/page/address_page/address_page.dart';
import '../../presentation/page/address_page/select_map_page/select_map_page.dart';
import '../../presentation/page/auth/login_page/login_page.dart';
import '../../presentation/page/auth/register_page/register_page.dart';
import '../../presentation/page/cart_page/cart_page.dart';
import '../../presentation/page/change_number/change_number_page.dart';
import '../../presentation/page/contact_page/contact_page.dart';
import '../../presentation/page/delivery_and_payment_page/delivery_and_payment_page.dart';
import '../../presentation/page/favorite_page/favorite_page.dart';
import '../../presentation/page/insurance_page/add_insurance_page.dart';
import '../../presentation/page/messenger_page/messenger_page.dart';
import '../../presentation/page/messenger_page/widget/chat_details.dart';
import '../../presentation/page/other_page/other_page.dart';
import '../../presentation/page/payment_method_page/payment_method_page.dart';
import '../../presentation/page/product_details_page/product_details_page.dart';
import '../../presentation/page/products_page/products_page.dart';
import '../../presentation/page/question_response_page/question_response_page.dart';
import '../../presentation/page/settings_page/settings_page.dart';
import '../../presentation/page/splash_page/splash_page.dart';
import '../../presentation/page/user_edit_page/user_edit_page.dart';
import '../enums/delivery_type.dart';

class Pager {
  Pager._();

  static app({bool? showSplash}) => BlocProvider(
      create: (context) => AuthenticationCubit()
        ..startApp(context, showSplash: showSplash ?? true),
      child: const App());

  static get landing => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AddressCubit()),
        BlocProvider(create: (context) => ProductsCubit()..fetchProduct()),
        BlocProvider(
            create: (context) => AddressCubit()..fetchMainAddress(true)),
      ], child: const LandingPage());

  static get register => MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ], child: RegisterPage());

  static get login => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ], child: const LoginPage());

  static selectMapPage(BuildContext context) => MultiBlocProvider(providers: [
        BlocProvider.value(value: BlocProvider.of<AddAddressCubit>(context)),
      ], child: const SelectMapPage());

  static get products => MultiBlocProvider(providers: [
        // BlocProvider(create: (context) => ProductOptionCubit()..fetchProduct()),
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ], child: const ProductsPage());

  static pharmacy(MapMedicine map) => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => FavoriteCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
            create: (context) =>
                ProductOptionDetailsCubit()..fetchProductMapGuid(map.guid!)),
      ], child: MapDetailsPage(maps: map));

  static get cart => MultiBlocProvider(providers: [
        BlocProvider(create: (context) => CartCubit()..fetch()),
        BlocProvider(create: (context) => WaitingOrdersCubit()),
        BlocProvider(create: (context) => DeliveryOrdersCubit()),
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

  static get addingInsurance => BlocProvider(
        create: (context) => InsuranceCubit(),
        child: AddAsanInsuranceInfo(),
      );

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

  static get messenger => BlocProvider(
        create: (context) => MessengerCubit(),
        child: MessengerPage(),
      );

  static get testFor => BlocProvider(
        create: (context) => TestForCubit(),
        child: TestForPage(),
      );

  static testFor2(BuildContext context, Cubit bloc) => BlocProvider.value(
        value: BlocProvider.of<TestForCubit>(context),
        child: TestFor2Page(bloc: bloc),
      );

  static chat(
          {String? storeGuid,
          String? storeName,
          String? guid,
          String? orderGuid}) =>
      BlocProvider.value(
        value: ChatMessengerCubit()
          ..configMessenger(
              storeGuid: storeGuid, orderGuid: orderGuid, guid: guid),
        child: ChatPage(storeName: storeName),
      );

  static addAddress(
          {Address? address, BuildContext? context, lat, long, title}) =>
      BlocProvider(
        create: (context) =>
            AddAddressCubit()..setAddress(context: context, address: address),
        child: AddAddressPage(addressModel: address),
      );

  static get otherPage => OtherPage();

  static get addInsuranceInfo => BlocProvider(
        create: (context) => InsuranceCubit()..getInsurance(),
        child: AddInsurancePage(),
      );

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
      ], child: ProductDetailsDetails());

  static get addressPage => BlocProvider(
        create: (context) => AddressCubit()..fetch(),
        child: AddressPage(),
      );

  static get orderConfirm => BlocProvider(
        create: (context) => AddressCubit()..fetch(),
        child: AddressPage(),
      );

  static deliveryAndPaymentPage(
          {required String orderGuid, required String deliveryType}) =>
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AddressCubit()..fetchMainAddress()),
          //BlocProvider(create: (context) => TabCountsCubit()),
          BlocProvider(
              create: (context) => DeliveryAndPaymentCubit()
                ..fetch(guid: orderGuid, deliveryType: deliveryType)),
          // BlocProvider(
          //   create: (context) => AddressCubit()..fetch(),
          // ),
          BlocProvider(create: (context) => CardCubit()..getCard()),
        ],
        child: DeliveryAndPaymentPage(
            orderGuid: orderGuid, deliveryType: deliveryType),
      );

  static webviewPage(
          {required String url,
          required BuildContext context,
          void Function()? whenSuccess,
          void Function()? whenUnSuccess}) =>
      WebviewPage(
        url: url,
        mainContext: context,
        whenUnSuccess: whenUnSuccess,
        whenSuccess: whenSuccess,
      );
}
