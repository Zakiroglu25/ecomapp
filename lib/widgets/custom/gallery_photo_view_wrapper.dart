// Flutter imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// Project imports:
// Package imports:
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:uikit/utils/delegate/my_printer.dart';
import 'package:uikit/widgets/doctoro_appbar/widgets/back_i_o_s.dart';

import 'carousel_indicator.dart';

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<String> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentImageIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentImageIndex = widget.initialIndex;
    bbbb("fgg: ${widget.galleryItems.length}");
  }

  void onPageChanged(int index) {
    setState(() {
      currentImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: widget.backgroundDecoration,
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Hero(
                tag: "ImageTag" + currentImageIndex.toString(),
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: _buildItem,
                  itemCount: widget.galleryItems.length,
                  loadingBuilder: widget.loadingBuilder,
                  backgroundDecoration: widget.backgroundDecoration,
                  pageController: widget.pageController,
                  onPageChanged: onPageChanged,
                  scrollDirection: widget.scrollDirection,
                  gaplessPlayback: true,
                ),
              ),
              Positioned.fill(
                bottom: 7,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CarouselIndicator(
                    imageNumber: widget.galleryItems.length,
                    currentImageIndex: currentImageIndex,
                  ),
                ),
              ),
              Positioned(
                top: 4, left: 0,
                //left: 20,
                child: BackIOS(),
              )
            ],
          ),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final String item = widget.galleryItems[index];
    //  eeee("a: " + (item.split('<'))[1].toString());
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(item),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained, //* (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.0,
    );
  }
}
