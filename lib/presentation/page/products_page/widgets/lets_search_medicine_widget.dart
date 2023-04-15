import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubit/products_cubit/products_cubit.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
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
            Image.asset(
              Assets.pngMedOpacity,
              height: 56,
              width: 56,
            ),
            Text(
              MyText.letsSearchMedicine,
              style: AppTextStyles.sfPro600,
            ),
            Text(MyText.medicineSubtitle,
                style:
                    AppTextStyles.sfPro500s13.copyWith(color: MyColors.black34)),
          ],
        ),
        color: MyColors.purple235,
      ),
    );
  }
}
