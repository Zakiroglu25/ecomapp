import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/delegate/navigate_utils.dart';
import '../../utils/screen/ink_wrapper.dart';

class CircleBackButton extends StatelessWidget {
  const CircleBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () => Go.pop(context),
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColors.grey245,
          ),
          child: Icon(Icons.arrow_back_rounded)),
    );
  }
}
