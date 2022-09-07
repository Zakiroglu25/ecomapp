import 'package:flutter/material.dart';

import '../../../../utils/constants/app_text_styles.dart';

class NamedAndSaveWidget extends StatelessWidget {
  const NamedAndSaveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Icon(Icons.keyboard_backspace),
              Spacer(),
              Text(
                "Ödəniş üsulu əlavə et",
                style: AppTextStyles.sfPro600s17,
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
