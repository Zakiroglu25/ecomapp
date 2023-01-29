import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../infrastructure/model/response/contact_model.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/constants/text.dart';
import '../../../../utils/enums/contact.dart';
import '../../../../utils/screen/ink_wrapper.dart';
import '../../../../widgets/custom/product_and_other_widget.dart';

class SocialItem extends StatelessWidget {
  final List<Contacts>? contact;

  SocialItem({this.contact});

  ContactType? type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ProductAndOtherWidget(
            color: MyColors.purple,
            h: 167.h,
            imageUrl: Assets.pngContact3x,
            title: MyText.contact,
            desc: MyText.contactDesc,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: contact!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: InkWrapper(
                    onTap: () {
                      if (contact![index].channel == "WHATSAPP") {
                        launch(
                            'https://api.whatsapp.com/send?phone=${contact![index].contact}');
                      } else if (contact![index].channel == "TELEGRAM") {
                        launch(
                            "https://telegram.me/${contact![index].contact}");
                      } else if (contact![index].channel == "INSTAGRAM") {
                        launch(
                            'https://www.instagram.com/_u/${contact![index].contact}');
                      }
                    },
                    child: Row(
                      children: [
                        if (contact![index].channel == "WHATSAPP")
                          Image.asset(Assets.pngWhatsapp),
                        if (contact![index].channel == "TELEGRAM")
                          Image.asset(Assets.pngTelegram),
                        if (contact![index].channel == "INSTAGRAM")
                          Image.asset(Assets.pngFacebook),
                        MySizedBox.w12,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              contact![index].channel!,
                              style: AppTextStyles.sfPro400s14
                                  .copyWith(fontSize: 14.sm),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
