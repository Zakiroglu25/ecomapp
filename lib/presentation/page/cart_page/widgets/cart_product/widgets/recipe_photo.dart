import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';

import '../../../../../../utils/constants/mock.dart';
import '../../../../../../utils/screen/errorable_image.dart';
import '../../../../../../widgets/main/product_item/widgets/product_image.dart';

class RecipePhoto extends StatelessWidget {
  const RecipePhoto({Key? key, required this.url}) : super(key: key);
  final String? url;
  @override
  Widget build(BuildContext context) {
    return ProductImage(imageUrl: url);
  }
}
