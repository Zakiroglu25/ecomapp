import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../widgets/general/app_loading.dart';

class ErrorableImage extends StatelessWidget {
  final String? imageUrl;
  final Widget? errorIcon;
  final Widget? placeHolder;
  final BoxFit? fit;
  final double? w;
  final double? h;

  ErrorableImage(
      {@required this.imageUrl,
      this.errorIcon,
      this.fit,
      this.placeHolder,
      this.h,
      this.w});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      fit: fit ?? BoxFit.contain,
      width: w,
      height: h,
      placeholder: (context, url) => Center(
          child: SizedBox(
              height: 10, width: 10, child: placeHolder ?? AppLoading())),
      errorWidget: (context, url, error) => errorIcon ?? Icon(Icons.error),
    );
  }
}
