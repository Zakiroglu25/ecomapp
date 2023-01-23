import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_cubit.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/border_radius.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';

import '../../../../utils/constants/sized_box.dart';

class SaveCardCheckBox extends StatelessWidget {
  const SaveCardCheckBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: BlocProvider.of<DeliveryAndPaymentCubit>(context).checkBoxStream,
      builder: (context, snapshot) {
        return InkWrapper(
          onTap: () =>
              context.read<DeliveryAndPaymentCubit>().inverseCheckBox(),
          child: Padding(
            padding: Paddings.paddingV5,
            child: Row(
              children: [
                SizedBox(
                  height: 18.0,
                  width: 18.0,
                  child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) =>
                            BorderSide(width: 1.5, color: MyColors.grey188),
                      ),
                      shape: RoundedRectangleBorder(borderRadius: Radiuses.r4),
                      value: snapshot.data ?? false,
                      // color of tick Mark
                      activeColor: MyColors.blue55,
                      onChanged: (v) {
                        BlocProvider.of<DeliveryAndPaymentCubit>(context)
                            .updateCheckBox(v!);
                      }),
                ),
                MySizedBox.w8,
                Text(MyText.saveCard, style: AppTextStyles.sfPro400s14),
              ],
            ),
          ),
        );
      },
    );
  }
}
