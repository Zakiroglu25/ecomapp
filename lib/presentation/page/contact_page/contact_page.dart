import 'package:doctoro/presentation/page/contact_page/widget/sosial_item.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/widgets/custom/text_title_big.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/text.dart';
import '../../../widgets/custom/product_and_other_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: MyColors.black),
      ),
      body: ListView(
        padding: Paddings.paddingH16,
        children: [
          BigSection(
            title: 'Əlaqə',
          ),
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
    );
  }
}