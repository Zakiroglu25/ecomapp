import 'package:uikit/presentation/page/contact_page/widget/sosial_item.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/widgets/custom/text_title_big.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/text.dart';
import '../../../widgets/custom/product_and_other_widget.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      title: "Əlaqə",
      user: false,
      notification: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // padding: Paddings.paddingH16,
          children: [
            ProductAndOtherWidget(
              color: MyColors.purple,
              h: 167.h,
              imageUrl: Assets.pngContact3x,
              title: MyText.contact,
              desc: MyText.contactDesc,
            ),
            SocialItem(
              name: "Whatsapp",
              path: Assets.pngWhatsapp,
              onTap: () {},
              isPng: true,
            ),
            SocialItem(
              name: "Telegram",
              path: Assets.pngTelegram,
              onTap: () {},
              isPng: true,
            ),
            SocialItem(
              name: "Facebook",
              path: Assets.pngFacebook,
              onTap: () {},
              isPng: true,
            ),
            SocialItem(
              name: "*8833",
              path: Assets.pngHotline,
              onTap: () {},
              content: "Qaynar xətt",
              isPng: true,
            )
          ],
        ),
      ),
    );
  }
}
