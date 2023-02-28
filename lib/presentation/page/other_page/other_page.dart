import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/delegate/navigate_utils.dart';
import 'package:uikit/utils/delegate/pager.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text.dart';
import '../../../widgets/custom/product_and_other_widget.dart';
import '../messenger_page/messenger_page.dart';
import '../settings_page/settings_page.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      title: MyText.other,
      physics: Physics.alwaysBounce,
      child: Padding(
        padding: Paddings.paddingH16,
        child: Column(
          children: [
            //MySizedBox.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductAndOtherWidget(
                  color: MyColors.blue157,
                  h: 167.h,
                  w: 167.w,
                  imageUrl: Assets.pngChat,
                  title: MyText.messenger,
                  desc: MyText.chat,
                  onTap: () {
                    Go.to(context, MessengerPage());
                  },
                ),
                ProductAndOtherWidget(
                  onTap: () => Go.to(context, Pager.addressPage),
                  color: MyColors.orange253,
                  h: 167.h,
                  w: 167.w,
                  imageUrl: Assets.location3x,
                  title: MyText.myAddresses,
                  desc: MyText.addressOther,
                ),
              ],
            ),
            MySizedBox.h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductAndOtherWidget(
                  onTap: () {
                    Go.to(context, Pager.paymentMethodPage);
                  },
                  color: MyColors.green235,
                  h: 167.h,
                  w: 167.w,
                  imageUrl: Assets.pngPaymentMethod3x,
                  title: MyText.paymentType,
                  desc: MyText.paymentOther,
                ),
                ProductAndOtherWidget(
                  onTap: () {
                    Go.to(context, Pager.addInsuranceInfo);
                  },
                  color: MyColors.purple240,
                  h: 167.h,
                  w: 167.w,
                  imageUrl: Assets.pngInsurance3x,
                  title: MyText.insurance,
                  desc: MyText.insuranceOther,
                ),
              ],
            ),
            MySizedBox.h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///bu olmayacaq
                ProductAndOtherWidget(
                  onTap: () {
                    Go.to(context, SettingsPage());
                  },
                  color: MyColors.grey245,
                  h: 167.h,
                  w: 167.w,
                  imageUrl: Assets.pngSetting,
                  title: MyText.settings,
                  desc: MyText.settingsOther,
                ),
                ProductAndOtherWidget(
                  onTap: () {
                    Go.to(context, Pager.contactPage);
                  },
                  color: MyColors.orange225,
                  h: 167.h,
                  w: 167.w,
                  imageUrl: Assets.pngContact3x,
                  title: MyText.contact,
                  desc: MyText.contactOther,
                ),
              ],
            ),
            MySizedBox.h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductAndOtherWidget(
                  onTap: () => {Go.to(context, Pager.faqPage)},
                  color: MyColors.red250,
                  h: 167.h,
                  w: 167.w,
                  imageUrl: Assets.pngQuestion3x,
                  title: MyText.questionAnswer,
                  desc: MyText.faqOther,
                ),
              ],
            ),
            MySizedBox.h100
          ],
        ),
      ),
    );
  }
}

void goToAddPage({required BuildContext context}) async {
  try {
    showCupertinoModalBottomSheet(
      expand: true,
      //isDismissible: true,
      context: context,

      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Center(child: Text("salam"));
      },
    );
  } catch (e) {}
}
