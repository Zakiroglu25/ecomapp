import 'package:flutter/material.dart';

import '../../../../utils/constants/sized_box.dart';

class ProductCartButtonSizer extends StatelessWidget {
  const ProductCartButtonSizer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // w: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            MySizedBox.w4,
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
