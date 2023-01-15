import 'package:flutter/material.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/mock.dart';
import '../../utils/screen/errorable_image.dart';

class MedPhoto extends StatelessWidget {
  const MedPhoto({Key? key, required this.productOptionImages})
      : super(key: key);
  final List<String>? productOptionImages;

  @override
  Widget build(BuildContext context) {
    return ErrorableImage(
      backColor: MyColors.white,
      imageUrl: productOptionImages.firstOrNull,
      w: 64,
      h: 64,
      r: 9,
    );
  }
}
