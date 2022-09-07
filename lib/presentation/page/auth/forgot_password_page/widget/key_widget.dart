import 'package:flutter/material.dart';

import '../../../../../utils/constants/assets.dart';

class KeyWidget extends StatelessWidget {
  const KeyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100, width: 100, child: Image.asset(Assets.keyChild));
  }
}
