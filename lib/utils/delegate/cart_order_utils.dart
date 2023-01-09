import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/model/locale/cart_order_status.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/order_status.dart';
import 'package:uikit/utils/constants/text.dart';

class CartOrderUtils {
  CartOrderUtils._();

  static CartOrderStatus cartOrderStatus(String status) {
    switch (status) {
      case OrderStatus.PENDING_APPROVAL:
        return CartOrderStatus(
            color: MyColors.grey245, text: MyText.recipeInReview);
      case OrderStatus.CANCELED:
      case OrderStatus.PAYMENT_UNSUCCESSFUL:
        return CartOrderStatus(
            color: MyColors.orange253, text: MyText.recipePartialyAccepted);
      case OrderStatus.REJECTED:
        return CartOrderStatus(color: MyColors.red249, text: MyText.rejected);
      case OrderStatus.APPROVED:
      case OrderStatus.PENDING_PAYMENT:
        return CartOrderStatus(
            color: MyColors.green235, text: MyText.recipeConfirmed);
      default:
        return CartOrderStatus(color: MyColors.grey245, text: "");
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
