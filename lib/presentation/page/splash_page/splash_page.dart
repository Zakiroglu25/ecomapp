import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/extensions/index.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/paddings.dart';
import '../../../widgets/general/app_big_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: MyColors.brand,
        padding: Paddings.paddingH30,
        child: const Center(child: AppBigLogo()),
      ),
    );
  }
}
