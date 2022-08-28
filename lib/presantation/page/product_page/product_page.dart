import 'package:doctoro/util/constants/assets.dart';
import 'package:doctoro/util/constants/colors.dart';
import 'package:doctoro/util/constants/paddings.dart';
import 'package:doctoro/util/constants/sized_box.dart';
import 'package:doctoro/util/constants/text.dart';
import 'package:doctoro/widget/custom/text_title_big.dart';
import 'package:doctoro/widget/doctoro_appbar/doctoro_appbar.dart';
import 'package:doctoro/widget/general/doctoro_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/delegate/navigate_utils.dart';
import '../../../widget/custom/product_and_other_widget.dart';
import '../medicine_details_page/medicine_details_page.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        contextA: context,
        title: '',
        user: true,
        notification: true,
      ),
      body: Padding(
        padding: Paddings.paddingH16,
        child: ListView(
          children: [
            BigSection(title: MyText.product),
            DoctoroField(
              hint: "Ad və ya istehsal olduğu ölkə",
              suffixIcon: SvgPicture.asset(Assets.svgSearch),
            ),
            ProductAndOtherWidget(
              onTap: () {
                Go.to(context, MedicineDetailsPage());
              },
              color: MyColors.purple,
              h: 167.h,
              imageUrl: Assets.medicine,
              title: "Dərmanlar",
              desc:
                  "Reseptli və reseptsiz satışda olan dərmanları buradan əldə edib qiymətlərini müqaisə edə bilərsiniz.",
            ),
            MySizedBox.h10,
            Container(
              height: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.blue0
              ),
              child: Row(
                children: [
                  Text("Paşa Sığorta məhsulları burada!"),
                  Image.asset(Assets.pasha)
                ],
              ),
            ),
            MySizedBox.h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductAndOtherWidget(
                  color: MyColors.green235,
                  h: 167.h,
                  w: 167.w,
                  imageUrl: Assets.pngBad,
                  title: "BAD",
                  desc: "Bioaktiv qidalar üçün əlavələr.",
                ),
                ProductAndOtherWidget(
                  color: MyColors.orange253,
                  h: 167.h,
                  w: 167.w,
                  imageUrl: Assets.medicine,
                  title: "Vitaminlər",
                  desc: "Bütün qrup vitəminləri əldə edin.",
                ),
              ],
            ),
            MySizedBox.h10,
            ProductAndOtherWidget(
              color: MyColors.red250,
              h: 167.h,
              w: 167.w,
              imageUrl: Assets.medicine,
              title: "Digər",
              desc: "Axtardığınız məhsulu tapmaq üçün",
            ),
            MySizedBox.h20,
          ],
        ),
      ),
    );
  }
}
