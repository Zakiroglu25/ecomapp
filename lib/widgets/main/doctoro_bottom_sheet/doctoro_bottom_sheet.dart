// Flutter imports:

import 'package:flutter/material.dart';

import 'widget/title_and_row_buttons.dart';

typedef OnItemSelected = void Function(List<String> selectedPromoCodeNames);

class OptimalBottomSheet extends StatelessWidget {
  final Widget? child;
  final Function? onConfirm;

  final bool? showCloseButton;
  final bool? showConfirmButton;
  final String? title;

  OptimalBottomSheet(
      {this.child,
      this.onConfirm,
      this.title,
      this.showCloseButton,
      this.showConfirmButton});

  @override
  Widget build(BuildContext context) {
    var sW = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          )),
      // height: 270,
      child: child!,
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
