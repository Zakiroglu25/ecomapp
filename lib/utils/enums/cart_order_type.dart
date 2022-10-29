import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:flutter/cupertino.dart';

enum CartOrderType {
  waiting,
  waitingPayment,
  confirmed;

  static Color color(CartOrderType cartOrderType) {
    switch (cartOrderType) {
      case CartOrderType.waiting:
        return MyColors.grey245;
      case CartOrderType.waitingPayment:
        return MyColors.orange242.withOpacity(.1);
      case CartOrderType.confirmed:
        return MyColors.green85.withOpacity(.1);
      default:
        return MyColors.green85.withOpacity(.1);
    }
  }

  static String stText(CartOrderType cartOrderType) {
    switch (cartOrderType) {
      case CartOrderType.waiting:
        return MyText.recipeInReview;
      case CartOrderType.waitingPayment:
        return MyText.recipePartialyAccepted;
      case CartOrderType.confirmed:
        return MyText.recipeConfirmed;
      default:
        return MyText.recipeInReview;
    }
  }
}
