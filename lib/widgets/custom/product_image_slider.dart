// Flutter imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/utils/delegate/my_printer.dart';
import 'package:uikit/utils/screen/errorable_image.dart';
import 'package:uikit/widgets/general/app_loading.dart';

import 'carousel_indicator.dart';
import 'gallery_photo_view_wrapper.dart';

class ProductImgSlider extends StatefulWidget {
  final List<String> imgList;

  ProductImgSlider({required this.imgList});

  @override
  _ProductImgSliderState createState() => _ProductImgSliderState();
}

class _ProductImgSliderState extends State<ProductImgSlider> {
  int currentImg = 0;
  late List<Widget> imageSliders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    imageSliders = widget.imgList
        .map((item) => GestureDetector(
              onTap: () {
                open(context, currentImg);
                bbbb("ytyukjk");
              },
              child: ErrorableImage(
                imageUrl: item,
                fit: BoxFit.contain,
                // width: 244,
                //height: 344,
              ),
            ))
        .toList();
  }

  void open(BuildContext context, final int index) {
    bbbb("widget.imgList: ${widget.imgList}");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GalleryPhotoViewWrapper(
                  galleryItems: widget.imgList,
                  loadingBuilder: (a, b) {
                    return Center(child: AppLoading());
                  },
                  backgroundDecoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                  initialIndex: index,
                  scrollDirection: Axis.horizontal,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 414.sp / 278.sp,
                pageSnapping: true,
                viewportFraction: 1.0,
                //   enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                onPageChanged: (int index, _) {
                  //  print("slider: " + index.toString());

                  setState(() {
                    currentImg = index;
                  });
                }),
            items: imageSliders,
            carouselController: CarouselController(),
          ),
          Positioned.fill(
            bottom: 7,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CarouselIndicator(
                imageNumber: imageSliders.length,
                currentImageIndex: currentImg,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
