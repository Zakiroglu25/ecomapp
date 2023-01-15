import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/custom_slide_to_confirm_button.dart';

class OrderSlideToConfirmButton extends StatelessWidget {
  const OrderSlideToConfirmButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSlideToConfirmButton(
        text: MyText.makeOrder,
        action: (controller) async {
          controller.loading(); //starts loading animation
          await Future.delayed(const Duration(seconds: 3));

          controller.success(); //starts success animation
        });
  }
}
