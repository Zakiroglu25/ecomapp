import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../infrastructure/cubit/products_cubit/products_cubit.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/column_with_space.dart';
import '../../../../widgets/general/app_element_box.dart';

class LetsSearchMedicineWidget extends StatelessWidget {
  const LetsSearchMedicineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>context.read<ProductsCubit>().searchFocus.requestFocus(),
      child: AppElementBox(
        padding: Paddings.paddingA20,
        child: SpacedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          space: 4,
          children: [
            SvgPicture.asset(
              Assets.red_logo,
              height: 44,
              width: 44,
            ),
            MySizedBox.h4,
            Text(
              MyText.nameDoctoro,
              style: AppTextStyles.sfPro600,
            ),
            Text(MyText.medicineSubtitle,
                style:
                    AppTextStyles.sfPro500s13.copyWith(color: MyColors.black34)),
          ],
        ),
        color: MyColors.secondary,
      ),
    );
  }
}
