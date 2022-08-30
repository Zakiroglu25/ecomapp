import 'package:doctoro/presentations/page/contact_page/contact_page.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/delegate/navigate_utils.dart';
import 'package:doctoro/utils/delegate/pager.dart';
import 'package:doctoro/widgets/doctoro_appbar/doctoro_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text.dart';
import '../../../widgets/custom/product_and_other_widget.dart';
import '../../../widgets/custom/text_title_big.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        user: true,
        contextA: context,
        title: "",
        notification: true,
        filter: false,
      ),
      body: ListView(
        padding: Paddings.paddingH16,
        children: [
          BigSection(title: MyText.bigTitle),
          MySizedBox.h30,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductAndOtherWidget(
                color: MyColors.blue157,
                h: 167.h,
                w: 167.w,
                imageUrl: Assets.pngMessenger3x,
                title: MyText.messenger,
                desc: MyText.demoSubtitle,
              ),
              ProductAndOtherWidget(
                onTap: () {
                  Go.to(context, Pager.addressPage);
                },
                color: MyColors.orange253,
                h: 167.h,
                w: 167.w,
                imageUrl: Assets.location3x,
                title: MyText.address,
                desc: MyText.demoSubtitle,
              ),
            ],
          ),
          MySizedBox.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductAndOtherWidget(
                color: MyColors.green235,
                h: 167.h,
                w: 167.w,
                imageUrl: Assets.pngPaymentMethod3x,
                title: MyText.paymentMetod,
                desc: MyText.demoSubtitle,
              ),
              ProductAndOtherWidget(
                color: MyColors.purple240,
                h: 167.h,
                w: 167.w,
                imageUrl: Assets.pngInsurance3x,
                title: MyText.insurance,
                desc: MyText.demoSubtitle,
              ),
            ],
          ),
          MySizedBox.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductAndOtherWidget(
                color: MyColors.green77,
                h: 167.h,
                w: 167.w,
                imageUrl: Assets.pngLikeMedicine,
                title: MyText.likeMedicine,
                desc: MyText.demoSubtitle,
              ),
              ProductAndOtherWidget(
                onTap: () {
                  Go.to(context, ContactPage());
                },
                color: MyColors.orange225,
                h: 167.h,
                w: 167.w,
                imageUrl: Assets.pngContact3x,
                title: MyText.contact,
                desc: MyText.demoSubtitle,
              ),
            ],
          ),
          MySizedBox.h10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductAndOtherWidget(
                color: MyColors.red250,
                h: 167.h,
                w: 167.w,
                imageUrl: Assets.pngQuestion3x,
                title: MyText.questionAnswer,
                desc: MyText.demoSubtitle,
              ),
              ProductAndOtherWidget(
                color: MyColors.grey245,
                h: 167.h,
                w: 167.w,
                imageUrl: Assets.pngSeting3x,
                title: MyText.settings,
                desc: MyText.demoSubtitle,
              ),
            ],
          ),
          MySizedBox.h100
        ],
      ),
    );
  }
}
