import 'package:flutter/material.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';

import '../../../../../../utils/constants/border_radius.dart';
import '../../../../../../utils/constants/colors.dart';

class CounterButton extends StatelessWidget {
  const CounterButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () {},
      radius: 99,
      child: Container(
        width: 38,
        height: 38,
        child: Center(
            child: Text(
          "$text",
          style: const TextStyle(color: MyColors.white),
        )),
        decoration:
            BoxDecoration(color: MyColors.grey158, borderRadius: Radiuses.r99),
      ),
    );
  }
}
