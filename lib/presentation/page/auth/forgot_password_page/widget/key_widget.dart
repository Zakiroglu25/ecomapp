import 'package:flutter/material.dart';

import '../../../../../utils/constants/assets.dart';
import '../../../../../utils/constants/durations.dart';
import '../../../../../utils/constants/sized_box.dart';
import '../../../../../widgets/custom/custom_animated_cross.dart';

class KeyWidget extends StatelessWidget {
  const KeyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedCross(
      showFirst: MediaQuery.of(context).viewInsets.bottom == 0,
      duration: Durations.ms200,
      second: MySizedBox.h4,
      first: Container(
          height: 100, width: 100, child: Image.asset(Assets.keyChild)),
    );
  }
}
