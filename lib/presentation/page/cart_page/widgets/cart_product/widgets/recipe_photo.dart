import 'package:flutter/material.dart';

import '../../../../../../widgets/main/product_item/widgets/product_image.dart';

class RecipePhoto extends StatelessWidget {
  const RecipePhoto({Key? key, required this.url}) : super(key: key);
  final String? url;
  @override
  Widget build(BuildContext context) {
    return ProductImage(imageUrl: url);
  }
}
