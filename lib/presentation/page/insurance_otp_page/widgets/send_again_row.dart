import 'package:flutter/material.dart';

import '../../../../../utils/constants/app_text_styles.dart';
import '../../../../../utils/screen/ink_wrapper.dart';

class SendAgainRow extends StatelessWidget {
  const SendAgainRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("0:23"),
        InkWrapper(
          onTap: () {},
          child: Text(
            "OTP yenidən göndər",
            style: AppTextStyles.sfPro600.copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
