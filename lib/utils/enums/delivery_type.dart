import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/text.dart';

enum DeliveryType {
  COURIER,
  IN_STORE_PICK_UP;

  String get toText => name;
  //String get toAzText => this==COURIER?MyText.delivery:MyText.iWillTakeIt;

  static String toAzText(String? type) =>
      type == COURIER.toText ? MyText.delivery : MyText.iWillTakeIt;
  static String toIconPath(String? type) =>
      type == COURIER.toText ? Assets.svgShoppingCart : Assets.svgUserTag;

  static int toIndex(String? type) => type == COURIER.toText ? 0 : 1;
  static String fromIndex(int? index) =>
      index == 0 ? COURIER.name : IN_STORE_PICK_UP.name;
}
//trn =>: transaction
