import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/border_radius.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/widgets/main/doctoro_bottom_sheet/widget/handle_line.dart';

class SliverHandler extends StatelessWidget {
  const SliverHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 24,
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      title: Container(
          decoration: const BoxDecoration(
            borderRadius: Radiuses.rt24,
            color: MyColors.white,
          ),
          //color: MyColors.white,
          child: const Center(child: HandleLine())),
      pinned: true,
    );
  }
}
