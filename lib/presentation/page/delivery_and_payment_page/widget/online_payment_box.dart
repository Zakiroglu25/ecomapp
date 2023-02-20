import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';

class OnlinePaymentBox extends StatelessWidget {
  const OnlinePaymentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16 + Paddings.paddingV5,
      //   padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: SvgPicture.asset(Assets.svgoOnlineCard),
          ),
          MySizedBox.w12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyText.makeOnlinePayment,
                style: AppTextStyles.sfPro600,
              ),
              Text(MyText.willAddDuringOrder,
                  style: AppTextStyles.sfPro400s14
                      .copyWith(color: MyColors.grey158)),
            ],
          ),
        ],
      ),
    );
  }
}
