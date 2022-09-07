import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleAndRowButtons extends StatelessWidget {
  final Function? onConfirm;
  final bool? showCloseButton;
  final bool? showConfirmButton;
  final String? title;

  const TitleAndRowButtons({
    Key? key,
    this.onConfirm,
    this.showCloseButton,
    this.showConfirmButton,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // showConfirmButton=true;
    //showCloseButton=false;
    return Container(
      //color: Colors.blue,
      //  height: 48,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // (showCloseButton ?? true) ? BottomCloseButton() : MySizedBox.w80,
          // title != null ? TitleText(title!) : Container(),
          // (showConfirmButton ?? true)
          //     ? ConfirmButton(() => onConfirm?.call())
          //     : MySizedBox.w75
        ],
      ),
    );
  }
}
