import 'package:flutter/material.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';

class ImageMessage extends StatelessWidget {
  const ImageMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      child: Center(
        child: Image.asset(Assets.marker),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: MyColors.green235),
    );
  }
}
