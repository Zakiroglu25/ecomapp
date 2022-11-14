import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/constants/text.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../../../utils/delegate/pager.dart';
import '../../../../widgets/custom/product_and_other_widget.dart';
import '../../../../widgets/custom/text_title_big.dart';
import 'bad_and_vitamin.dart';
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
      child: ListView(
        children: [
          BigSection(title: MyText.nameDoctoro),
          const SearchField(),
          ProductAndOtherWidget(
            onTap: () {
              Go.to(context, Pager.productDetails);
            },
            color: MyColors.purple,
            h: 167.h,
            imageUrl: Assets.medicine,
            title: MyText.medicine,
            desc: MyText.medicineSubtitle,
          ),
          MySizedBox.h10,
          const PashaItem(),
          MySizedBox.h10,
          const BadAndVitamin(),
          MySizedBox.h10,
          ProductAndOtherWidget(
            color: MyColors.red250,
            h: 167.h,
            w: 167.w,
            imageUrl: Assets.pngLab3x,
            title: MyText.other,
            desc: MyText.otherSub,
          ),
          MySizedBox.h20,
        ],
      ),
    );
  }
}
