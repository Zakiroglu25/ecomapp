import 'package:flutter/material.dart';

import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/text_title_big.dart';
import 'pasha_item.dart';
import 'search_field.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.paddingH16,
      child: Stack(
        children: [
          BigSection(title: MyText.nameDoctoro),
          const SearchField(),
          // ProductAndOtherWidget(
          //   onTap: () {
          //     Go.to(context, Pager.productDetails);
          //   },
          //   color: MyColors.purple,
          //   h: 167.h,
          //   imageUrl: Assets.medicine,
          //   title: MyText.medicine,
          //   desc: MyText.medicineSubtitle,
          // ),
          // MySizedBox.h10,
          // MySizedBox.h10,
          // const BadAndVitamin(),
          // MySizedBox.h10,
          // ProductAndOtherWidget(
          //   color: MyColors.red250,
          //   h: 167.h,
          //   w: 167.w,
          //   imageUrl: Assets.pngLab3x,
          //   title: MyText.other,
          //   desc: MyText.otherSub,
          // ),
          // MySizedBox.h20,
          Positioned(bottom: 0, child: PashaItem()),
        ],
      ),
    );
  }
}
