import 'package:cached_network_image/cached_network_image.dart';
import 'package:doctoro/utils/screen/ink_wrapper.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom/gallery_photo_view_wrapper.dart';
import '../../widgets/general/app_loading.dart';

class ErrorableImage extends StatelessWidget {
  final String imageUrl;
  final Widget? errorIcon;
  final Widget? placeHolder;
  final BoxFit? fit;
  final bool? openable;
  final double? w;
  final double? h;
  final Color? backColor;
  final double? r;

  ErrorableImage(
      {required this.imageUrl,
      this.errorIcon,
      this.fit,
      this.placeHolder,
      this.backColor,
      this.openable = true,
      this.h,
      this.r,
      this.w});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(r ?? 0),
      child: InkWrapper(
        onTap: () => open(context, 0),
        child: Container(
          color: backColor,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit ?? BoxFit.contain,
            width: w,
            height: h,
            memCacheHeight: 300,
            memCacheWidth: 300,
            placeholder: (context, url) => Center(
                child: SizedBox(
                    height: 10, width: 10, child: placeHolder ?? AppLoading())),
            errorWidget: (context, url, error) =>
                errorIcon ?? Icon(Icons.error),
          ),
        ),
      ),
    );
  }

  void open(BuildContext context, final int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GalleryPhotoViewWrapper(
                  galleryItems: [imageUrl],
                  loadingBuilder: (a, b) {
                    return Center(child: AppLoading());
                  },
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  initialIndex: index,
                  scrollDirection: Axis.horizontal,
                )));
  }
}
