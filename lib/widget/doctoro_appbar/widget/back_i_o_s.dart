import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../util/constants/assets.dart';

class BackIOS extends StatelessWidget {
  final Function? onBack;

  BackIOS({this.onBack});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: IconButton(
          onPressed: () {
            if (onBack != null) {
              onBack?.call();
            } else {
              Navigator.pop(context);
            }
          },
          icon: SvgPicture.asset(Assets.svgBackArrow)),
    );
  }
}
