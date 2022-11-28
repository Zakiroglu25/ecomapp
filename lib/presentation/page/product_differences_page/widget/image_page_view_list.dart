import 'package:flutter/material.dart';

import 'image_indicator_widget.dart';

class ImagePageViewList extends StatefulWidget {
  const ImagePageViewList({
    Key? key,
    required this.controller,
    required this.offerImage,
    required this.currentIndex,
  }) : super(key: key);

  final PageController controller;
  final List<String> offerImage;
  final int currentIndex;

  @override
  State<ImagePageViewList> createState() => _ImagePageViewListState();
}

class _ImagePageViewListState extends State<ImagePageViewList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          PageView.builder(
            controller: widget.controller,
            itemCount: widget.offerImage.length,
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                // currentIndex = index;å
              });
            },
            itemBuilder: (context, i1) {
              return Stack(
                children: [
                  Center(
                    child: SizedBox(
                      height: 260,
                      width: 260,
                      child: Image.asset(
                        widget.offerImage[i1],
                        // List of Offers precentages
                        width: MediaQuery.of(context).size.width,
                        colorBlendMode: BlendMode.softLight,
                        color: Colors.black.withOpacity(0.8),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ), //  end offers
                ],
              );
            },
          ),
          ImageIndicatorWidget(
              offerPercentage: widget.offerImage,
              currentIndex: widget.currentIndex) // end indicator
        ],
      ),
    );
  }
}
