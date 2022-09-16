import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/delegate/cart_operations.dart';
import 'package:doctoro/utils/delegate/my_printer.dart';
import 'package:doctoro/utils/enums/cart_order_type.dart';
import 'package:doctoro/utils/extensions/word.dart';
import 'package:doctoro/utils/screen/widget_or_empty.dart';
import 'package:doctoro/widgets/custom/app_button.dart';
import 'package:flutter/material.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/assets.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/widgets/custom/column_with_space.dart';
import 'package:doctoro/widgets/custom/dots_button.dart';
import 'package:doctoro/widgets/custom/row_with_space.dart';
import 'package:doctoro/widgets/general/app_element_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nil/nil.dart';

import '../../../../../utils/constants/text.dart';

class CartOrderProduct extends StatelessWidget {
  const CartOrderProduct({Key? key, required this.cartOrderType})
      : super(key: key);
  final CartOrderType cartOrderType;
  @override
  Widget build(BuildContext context) {
    return AppElementBox(
      color: CartOrderType.color(cartOrderType),
      child: SpacedColumn(
          space: 6,
          padding: Paddings.paddingA8,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(Assets.svgShoppingCart),
                DotsButton(
                    controller: CustomPopupMenuController(),
                    menuBuilder: () {
                      return nil;
                    })
              ],
            ),
            Text(
              "Baglama 001",
              style: AppTextStyles.sfPro600.copyWith(fontSize: 16),
            ),
            MySizedBox.h2,
            SpacedRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dərman sayı: 5',
                    style: AppTextStyles.sfPro500s13,
                  ),
                  Text(
                    'Sifariş tarixi: 27.08.2022',
                    style: AppTextStyles.sfPro500s13,
                  ),
                ]),
            SpacedRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Qiymət: 64.00 ₼',
                    style: AppTextStyles.sfPro500s13,
                  ),
                ]),
            MySizedBox.h14,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Row(
                      // space: 12,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(Assets.svgClock),
                        MySizedBox.w8,
                        Flexible(
                          child: Text(
                            CartOrderType.stText(cartOrderType),
                            style: AppTextStyles.sfPro500,
                            //  overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ]),
                ),
                WidgetOrEmpty(
                  value: cartOrderType == CartOrderType.waitingPayment,
                  child: Expanded(
                    flex: 2,
                    child: Padding(
                      padding: Paddings.paddingL8,
                      child: AppButton.black(
                        h: 36,
                        text: MyText.pay.withPrice(999.999),
                        // w: 140,
                      ),
                    ),
                  ),
                )
              ],
            )
          ]),
    );
  }
}
