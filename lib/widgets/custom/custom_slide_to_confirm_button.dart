import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/text.dart';

class CustomSlideToConfirmButton extends StatelessWidget {
  const CustomSlideToConfirmButton(
      {Key? key, required this.text, required this.action})
      : super(key: key);
  final String text;
  final dynamic Function(ActionSliderController)? action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ActionSlider.standard(
        boxShadow: [],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: AppTextStyles.sfPro600.copyWith(color: MyColors.white),
            ),
            Text(
              MyText.slideToConfirm,
              style: AppTextStyles.sfPro600
                  .copyWith(fontSize: 11, color: MyColors.white),
            ),
          ],
        ),
        action: action,
        backgroundColor: MyColors.blue55,
        toggleColor: MyColors.white,
        icon: const Icon(
          Icons.arrow_forward_rounded,
          color: MyColors.blue55,
        ),
        //    ... //many more parameters
      ),
    );
  }
}
