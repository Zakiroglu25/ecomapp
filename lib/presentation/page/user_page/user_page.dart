import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sized_box.dart';
import 'widget/user_data_body.dart';
import 'widget/user_data_item_widget.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);


  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  int _currentIndex = 0;

  final _pageViewController =
      PageController(initialPage: 0, viewportFraction: 0.75);

  final cards = [
    UserView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.red250,
      body: PageView.builder(
          controller: _pageViewController,
          itemCount: cards.length,
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

class UserView extends StatelessWidget {
  const UserView({super.key});

  HiveService get _prefs => locator<HiveService>();

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
            child: UserDataBody(prefs: _prefs),
          ),
        ),
      ],
    );
  }
}
