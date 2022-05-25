import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../util/constants/app_text_styles.dart';
import '../../util/constants/assets.dart';
import '../../util/constants/colors.dart';
import '../../util/constants/sized_box.dart';
import '../../util/constants/text.dart';

class PageviewElement extends StatelessWidget{
  final String? svgLogo;
  final String? bigText;
  final String? littleText;
  final String? bigImage;

  PageviewElement({this.svgLogo, this.bigText, this.littleText, this.bigImage});

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.only(left: 32.0),
     child: SingleChildScrollView(
       child: Column(
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               MySizedBox.h80,
               SizedBox(
                 width: 194,
                 child: Text(bigText!,
                     style: AppTextStyles.sfPro700
                         .copyWith(fontSize: 32, color: MyColors.black0)),
               ),
               MySizedBox.h8,
               SizedBox(
                 width: 223,
                 child: Text(littleText!,
                     style: AppTextStyles.sfPro400
                         .copyWith(fontSize: 14, color: MyColors.little_text)),
               ),
               MySizedBox.h32,
               Padding(
                 padding: const EdgeInsets.only(left: 8.0, right: 40),
                 child: Image.asset(bigImage!),
               ),
             ],
           ),
         ],
       ),
     ),
   );
  }
}