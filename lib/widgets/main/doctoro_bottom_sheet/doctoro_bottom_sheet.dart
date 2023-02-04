// Flutter imports:

import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/physics.dart';

import '../../../utils/constants/border_radius.dart';
import 'widget/handle_line.dart';
import 'widget/title_and_row_buttons.dart';

typedef OnItemSelected = void Function(List<String> selectedPromoCodeNames);

class AppBottomSheet extends StatelessWidget {
  final Widget? child;
  final Function? onConfirm;
  final bool? showCloseButton, showConfirmButton;
  final bool showHandle;
  final String? title;

  const AppBottomSheet(
      {Key? key,
      required this.child,
      this.onConfirm,
      this.title,
      this.showCloseButton,
      this.showHandle = true,
      this.showConfirmButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sW = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white70, borderRadius: Radiuses.rt24),
      // height: 270,
      child: SingleChildScrollView(
        //shrinkWrap: true,
        physics: Physics.never,
        child: Column(
          // shrinkWrap: true,
          // physics: Physics.never,
          children: [
            showHandle ? const HandleLine() : Container(),
            ListView(
              shrinkWrap: true,
              physics: Physics.never,
              // mainAxisSize: MainAxisSize.min,
              children: [
                child!,
              ],
            ),
          ],
        ),
      ),
    );
  }

  TitleAndRowButtons titleAndButtons(
      {Function? onConfirm,
      bool? showCloseButton,
      bool? showConfirmButton,
      String? title}) {
    return TitleAndRowButtons(
      onConfirm: () {
        onConfirm?.call();
      },
      showCloseButton: showCloseButton,
      showConfirmButton: showConfirmButton,
      title: title,
    );
  }
}
