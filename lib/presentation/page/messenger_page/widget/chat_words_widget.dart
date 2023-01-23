import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/colors.dart';

class ChatWordsWidget extends StatelessWidget {
  const ChatWordsWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 140.w,
        decoration: BoxDecoration(
            color: MyColors.field_grey,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 6, bottom: 6),
            child: SizedBox(
                child: Text(message))),
      ),
    );
  }
}
