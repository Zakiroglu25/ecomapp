import 'package:flutter/material.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../../utils/constants/text.dart';
import '../../../../widgets/custom/app_button.dart';

class SheetAddNewAddressButton extends StatelessWidget {
  const SheetAddNewAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: MyText.addNewAddress,
      onTap: () => Go.to(context, Pager.addAddress()),
    );
  }
}
