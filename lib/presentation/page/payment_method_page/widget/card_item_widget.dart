import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../infrastructure/cubit/card_cubit/card_cubit.dart';
import '../../../../infrastructure/model/response/card_model.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/constants/text.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../../../utils/screen/alert.dart';
import '../../../../utils/screen/ink_wrapper.dart';
import '../../../../widgets/custom/app_button.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    Key? key,
    required this.cardList,
  }) : super(key: key);

  final CardModel cardList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "KARTLAR",
          style: AppTextStyles.sfPro400s14.copyWith(color: MyColors.grey158),
        ),
        MySizedBox.h4,
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: MyColors.grey245,
            ),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cardList.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    MySizedBox.h16,
                    Row(
                      children: [
                        MySizedBox.w16,
                        SizedBox(
                          width: 40.w,
                          height: 28.h,
                          child: Image.asset(
                              cardList.data[index].brand == "MASTER"
                                  ? Assets.masterCard
                                  : Assets.visa),
                        ),
                        MySizedBox.w16,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              cardList.data[index].pan!,
                              style: AppTextStyles.sfPro500
                                  .copyWith(fontSize: 16.sp),
                            ),
                            Text(
                              cardList.data[index].cardHolderName!,
                              style: AppTextStyles.sfPro400s14
                                  .copyWith(color: MyColors.grey158),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWrapper(
                            onTap: () {
                              Alert.show(context, buttonText: MyText.yes,
                                  onTap: () {
                                context
                                    .read<CardCubit>()
                                    .deleteCard(cardList.data[index].guid!);
                              },
                                  title: MyText.deleteCardInfo,
                                  secondButton: AppButton(
                                    color: MyColors.main,
                                    text: MyText.no,
                                    onTap: () {
                                      Go.pop(context);
                                    },
                                  ));
                            },
                            child: SvgPicture.asset(Assets.svgDelete)),
                        MySizedBox.w16,
                      ],
                    ),
                    MySizedBox.h16,
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            )),
      ],
    );
  }
}
