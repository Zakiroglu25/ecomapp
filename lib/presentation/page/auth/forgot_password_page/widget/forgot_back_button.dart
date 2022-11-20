import 'package:flutter/material.dart';

import '../../../../../widgets/general/circleback_button.dart';

class ForgotBackButton extends StatelessWidget {
  const ForgotBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(top: 10, left: 15, child: CircleBackButton());
  }
}
