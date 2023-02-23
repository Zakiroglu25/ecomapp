import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/screen/errorable_image.dart';
import '../../../../widgets/general/app_element_box.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails(
      {Key? key, required this.imageUrl, required this.storeName})
      : super(key: key);
  final String? storeName;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return AppElementBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ErrorableImage(
            imageUrl: imageUrl,
            w: 48,
            r: 48,
            h: 48,
          ),
          MySizedBox.w16,
          Flexible(
            child: Text(
              storeName ?? '',
              style:
                  AppTextStyles.sfPro600s16.copyWith(color: MyColors.black34),
            ),
          )
        ],
      ),
    );
  }
}
