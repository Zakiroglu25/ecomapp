import 'package:flutter/material.dart';

import '../../../../utils/constants/border_radius.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/screen/errorable_image.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key, required this.imageUrl}) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: Radiuses.r9,
      child: Container(
        height: 64,
        width: 64,
        color: MyColors.white,
        child: Center(
          child: ErrorableImage(
            imageUrl: imageUrl,
          ),
        ),
      ),
    );
  }
}
