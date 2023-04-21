import 'package:flutter/material.dart';
import 'package:uikit/utils/extensions/index.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/general/empty_widget.dart';

class MessengerEmptyWidget extends StatelessWidget {
  const MessengerEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sH / 1.5,
      child: EmptyWidget(
        imageUrl: Assets.pngChat,
        color: MyColors.blue157,
        text: MyText.emptyText,
        description: MyText.emptyMessenger,
      ),
    );
  }
}
