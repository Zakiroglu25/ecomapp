import 'package:flutter/material.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/mock.dart';
import '../../../../../../utils/screen/errorable_image.dart';

class MedPhoto extends StatelessWidget {
  const MedPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorableImage(
      backColor: MyColors.white,
      imageUrl: MockData.paracetamolImgURL,
      w: 64,
      h: 64,
      r: 9,
    );
  }
}
