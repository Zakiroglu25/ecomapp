import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';

class DoctoroChatLogo extends StatelessWidget {
  const DoctoroChatLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28.w,
      height: 28.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.mainRED),
      child: SizedBox(
        width: 28.w,
        height: 28.h,
        child: Center(
          child: SvgPicture.asset(
            Assets.svgLogo,
            color: MyColors.white,
            width: 16,
            height: 16,
          ),
        ),
      ),
    );
  }
}
