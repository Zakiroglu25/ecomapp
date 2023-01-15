import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/screen/errorable_image.dart';

class StoreLogo extends StatelessWidget {
  const StoreLogo({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return ErrorableImage(
      backColor: MyColors.white,
      imageUrl: url,
      w: 48,
      h: 48,
      r: 48,
    );
  }
}
