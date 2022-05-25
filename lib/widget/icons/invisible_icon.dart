import 'package:animate_do/animate_do.dart';
import 'package:doctoro/util/constants/colors.dart';
import 'package:flutter/material.dart';

//class InvisibleIcon extends StatelessWidget {


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/constants/assets.dart';

class InvisibleIcon extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FlipInY(
         key: Key('b'),
        child: SvgPicture.asset(Assets.svgEyeOff,color: MyColors.grey188,));
  }
}
