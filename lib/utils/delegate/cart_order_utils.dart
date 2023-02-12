import 'package:uikit/infrastructure/model/locale/cart_order_status.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/order_status.dart';
import 'package:uikit/utils/constants/text.dart';

class CartOrderUtils {
  CartOrderUtils._();

  static CartOrderStatus cartOrderStatus(String status) {
    switch (status) {
      case OrderStatus.PENDING_APPROVAL:
        return CartOrderStatus(
            color: MyColors.grey245,
            text: MyText.recipeInReview,
            statusIcon: Assets.svgClock);
      case OrderStatus.CANCELED:
      case OrderStatus.PAYMENT_UNSUCCESSFUL:
        return CartOrderStatus(
            color: MyColors.orange253,
            text: MyText.recipePartialyAccepted,
            statusIcon: Assets.svgWarning);
      case OrderStatus.REJECTED:
        return CartOrderStatus(
            color: MyColors.red249,
            text: MyText.rejected,
            statusIcon: Assets.svgWarning,
            statusIconColor: MyColors.errorRED);
      case OrderStatus.APPROVED:
      case OrderStatus.PENDING_PAYMENT:
        return CartOrderStatus(
            color: MyColors.green235,
            text: MyText.recipeConfirmed,
            statusIcon: Assets.svgTickCircle);
      case OrderStatus.PACKAGING:
        return CartOrderStatus(
            color: MyColors.green235,
            text: MyText.recipeConfirmedAndDelivering,
            statusIcon: Assets.svgTickCircle);
      case OrderStatus.DELIVERED:
        return CartOrderStatus(
            color: MyColors.green235,
            text: MyText.recipeAcceptedAndDelivered,
            statusIcon: Assets.svgTickCircle);
      case OrderStatus.PICKED_UP:
        return CartOrderStatus(
            color: MyColors.green235,
            text: MyText.packagePickedUp,
            statusIcon: Assets.svgTickCircle);
      case OrderStatus.READY_TO_PICK_UP:
        return CartOrderStatus(
            color: MyColors.green235,
            text: MyText.packageReadyForPickUp,
            statusIcon: Assets.svgTickCircle);
      case OrderStatus.RETURNED:
        return CartOrderStatus(
            color: MyColors.red249,
            text: MyText.packageReturned,
            statusIcon: Assets.svgWarning,
            statusIconColor: MyColors.errorRED);
      default:
        return CartOrderStatus(
            color: MyColors.grey245, text: "", statusIcon: Assets.svgClock);
    }
  }

  // static Color color(String status) {
  //   switch (status) {
  //     case OrderStatus.PENDING_APPROVAL:
  //       return MyColors.grey245;
  //     case OrderStatus.CANCELED:
  //     case OrderStatus.PAYMENT_UNSUCCESSFUL:
  //     case OrderStatus.REJECTED:
  //       return MyColors.orange242.withOpacity(.1);
  //     case OrderStatus.APPROVED:
  //     case OrderStatus.PENDING_PAYMENT:
  //       return MyColors.mainGreen85.withOpacity(.1);
  //     default:
  //       return MyColors.grey245.withOpacity(.1);
  //   }
  // }

  // static String message(String status) {
  //   switch (status) {
  //     case OrderStatus.PENDING_APPROVAL:
  //       return MyText.recipeInReview;
  //     case OrderStatus.CANCELED:
  //     case OrderStatus.PAYMENT_UNSUCCESSFUL:
  //     case OrderStatus.REJECTED:
  //       return MyText.recipePartialyAccepted;
  //     case OrderStatus.APPROVED:
  //     case OrderStatus.PENDING_PAYMENT:
  //       return MyText.recipeConfirmed;
  //     default:
  //       return '';
  //   }
  // }
}
