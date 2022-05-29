// Flutter imports:
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/main/doctoro_bottom_sheet/doctoro_bottom_sheet.dart';

// Project imports:
import '../../../widget/general/custom_bottom_sheet.dart' as bs;

class Sheet {
  static display({
    required BuildContext? context,
    Widget? child,
    final OnItemSelected? onItemSelected,
    final Function? onConfirm,
    final bool? showCloseButton = false,
    final bool? showConfirmButton = false,
    final String? title,
  }) {
    //Scaffold.of(context).hideCurrentSnackBar();

    bs.showModalBottomSheet(
        useRootNavigator: false,
        enableDrag: true,
        isDismissible: true,
        barrierColor: Colors.black.withOpacity(.2),
// barrierColor: Colors.red,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        ),
        context: context!,
        builder: (contextZ) => OptimalBottomSheet(
          child: child!,
          onConfirm: onConfirm,
          showCloseButton: showCloseButton,
          showConfirmButton: showConfirmButton,
          title: title,
        ));
  }
}
