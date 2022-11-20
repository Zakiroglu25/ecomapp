import 'package:flutter/material.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';
import 'package:uikit/utils/screen/sheet.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';

class AppBarAddressWidget extends StatelessWidget {
  const AppBarAddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWrapper(
        onTap: () {
          Sheet.display(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Burda Address Listi olacaq"),
                ],
              ),
              context: context);
        },
        child: Container(
          margin: Paddings.paddingH20,
          padding: Paddings.paddingH16 + Paddings.paddingV10,
          // width: 224.w,
          // height: 44.h,
          decoration: BoxDecoration(
            color: MyColors.green235,
            borderRadius: BorderRadius.circular(36),
          ),
          child: Row(
            //  mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.location_on_sharp,
                color: MyColors.green,
              ),
              MySizedBox.w12,
              Flexible(
                child: Text(
                  "Qara Qarayev ev 4 Menzil 35 ve ne bilim ne",
                  style: AppTextStyles.sfPro400s14
                      .copyWith(color: MyColors.green85),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: MyColors.green,
              )
            ],
          ),
        ),
      ),
    );
  }
}
