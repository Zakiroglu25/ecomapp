import 'package:flutter/material.dart';

import '../../../../util/constants/assets.dart';
import '../../../../util/constants/colors.dart';
import '../../../../util/constants/paddings.dart';
import '../../../../util/constants/sized_box.dart';
import '../../../../util/constants/text.dart';
import '../../../../widget/general/empty_widget.dart';
import 'fovorite_item.dart';

class FavTabbarWidget extends StatelessWidget {
  const FavTabbarWidget({
    Key? key,
    required TabController? controller,
  }) : _controller = controller, super(key: key);

  final TabController? _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            Padding(
              padding: Paddings.paddingH16,
              child: ListView(
                children: [
                  ListItemWidget(),
                  MySizedBox.h16,
                  ListItemWidget(),
                ],
              ),
            ),
            ///bunu muveqqeti qoymusham
            EmptyWidget(
              color: MyColors.red249,
              imageUrl: Assets.dHeart,
              description: MyText.demoSubtitle,
              text: MyText.empty,
            ),
          ]),
    );
  }
}
