import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/widgets/custom/text_title_big.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/assets.dart';
import '../../../widgets/custom/product_and_other_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: MyColors.black0),
      ),
      body: ListView(
        children: [
          BigSection(
            title: 'Əlaqə',
          ),
          ProductAndOtherWidget(
            color: MyColors.purple,
            h: 167.h,
            imageUrl: Assets.pngContact3x,
            title: "Dərmanlar",
            desc:
                "Reseptli və reseptsiz satışda olan dərmanları buradan əldə edib qiymətlərini müqaisə edə bilərsiniz.",
          ),
        ],
      ),
    );
  }
}
