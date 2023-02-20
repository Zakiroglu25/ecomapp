import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';

import '../../widgets/custom/gallery_photo_view_wrapper.dart';
import '../../widgets/general/app_loading.dart';

class ErrorableImage extends StatelessWidget {
  final String? imageUrl;
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
        onTap: imageUrl != null ? () => open(context, 0) : null,
        child: Container(
          color: backColor,
          child: imageUrl != null
              ? CachedNetworkImage(
                  imageUrl: imageUrl!,
                  fit: BoxFit.cover,
                  width: w,
                  height: h,
                  // memCacheHeight: 300,
                  // memCacheWidth: 300,
                  placeholder: (context, url) => Center(
                      child: SizedBox(
                          height: 10,
                          width: 10,
                          child: placeHolder ?? AppLoading.blue())),
                  errorWidget: (context, url, error) => errorImage(),
                )
              : errorImage(),
        ),
      ),
    );
  }

  Widget errorImage() =>
      errorIcon ??
      const Icon(
        Icons.error,
        color: MyColors.grey158,
      );

  void open(BuildContext context, final int index) {
    Go.to2(
        context,
        GalleryPhotoViewWrapper(
          galleryItems: [imageUrl!],
          loadingBuilder: (a, b) {
            return Center(child: AppLoading());
          },
          backgroundDecoration: const BoxDecoration(
            color: Colors.white,
          ),
          initialIndex: index,
          scrollDirection: Axis.horizontal,
        ));
  }
}
