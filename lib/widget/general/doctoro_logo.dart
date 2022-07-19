import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/constants/assets.dart';

class DoctoroLogo extends StatelessWidget {
 final Color? color;


 DoctoroLogo({this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.red_logo,color: color ,);
  }
}
