import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/colors.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  int _currentIndex = 0;

  final _pageViewController =
      PageController(initialPage: 0, viewportFraction: 0.75);

  final cards = [
    Test(),
    Test(),
    Test(),
    Test(),
    Test(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.red250,
      body: PageView.builder(
          controller: _pageViewController,
          itemCount: 3,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            final images = cards[index];
            var _scale = _currentIndex == index ? 1.0 : 0.8;
            return TweenAnimationBuilder(
                tween: Tween(begin: _scale, end: _scale),
                duration: const Duration(milliseconds: 350),
                child: images,
                builder: (context, double value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                });
          }),
    );
  }
}

class Test extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: MyColors.white),
            width: 311,
            height: 420,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 166,
                        child: Text(
                          "Şəxs haqqında haqqında məlumatlar",
                          style: AppTextStyles.sfPro600s17,
                        ),
                      ),
                      Icon(Icons.edit)
                    ],
                  ),
                  Text("_prefs.user.phone!")
                ],
              ),
            )),
      ],
    );
  }
}
