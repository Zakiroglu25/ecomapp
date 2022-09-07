import 'package:flutter/material.dart';

class ImageIndicatorWidget extends StatelessWidget {
  const ImageIndicatorWidget({
    Key? key,
    required this.offerPercentage,
    required int currentIndex,
  })  : _currentIndex = currentIndex,
        super(key: key);

  final List<String> offerPercentage;
  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15, // Position form Bottom
      left: 160,
      // Position from Right
      child: Container(
        height: 15,
        child: ListView.builder(
          itemCount: offerPercentage.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int i2) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 5,
                width: 15,
                decoration: _currentIndex == i2
                    ? BoxDecoration(
                    color: Colors.black, // Selected Slider Indicator Color
                    borderRadius: BorderRadius.circular(15))
                    : const BoxDecoration(
                    color: Colors.grey, // Unselected Slider Indicator Color
                    shape: BoxShape.circle // shape of Unselected indicator
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
