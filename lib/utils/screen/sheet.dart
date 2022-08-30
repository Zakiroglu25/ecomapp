// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import '../../../widgets/general/custom_bottom_sheet.dart' as bs;
import '../../widgets/main/doctoro_bottom_sheet/doctoro_bottom_sheet.dart';

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
