import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/colors.dart';

class ChatWordsWidget extends StatelessWidget {
  const ChatWordsWidget({
    Key? key,
    required this.message,
    required this.date,
  }) : super(key: key);

  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 142.w,
        decoration: BoxDecoration(
            color: MyColors.field_grey,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 8, bottom: 8),
            child: SizedBox(
                child: Column(
              children: [
                Align(alignment: Alignment.centerLeft, child: Text(message)),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(date.substring(11, 16),
                      style: AppTextStyles.sfPro400s12
                          .copyWith(color: MyColors.grey165)),
                ),
              ],
            ))),
      ),
    );
  }
}
