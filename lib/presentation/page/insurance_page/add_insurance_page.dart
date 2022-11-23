import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';

import '../../../utils/constants/assets.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../widgets/custom/app_button.dart';
import '../add_asan_insurance_info/add_asan_insurance_info_page.dart';
import 'widget/slidable_item_widget.dart';

class AddInsurancePage extends StatelessWidget {
  const AddInsurancePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      title: "Sığorta",
      notification: false,
      user: false,
      child: Column(
        children: [
          MySizedBox.h22,
          SlidableWidget(
            title: "Pasha Sığorta",
            subTitle:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            insuranceIcon: Assets.pasha,
            status: 1,
          ),
          SlidableWidget(
            title: "Pasha Sığorta",
            subTitle:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            insuranceIcon: Assets.pasha,
            status: 2,
          ),
          SlidableWidget(
            title: "Pasha Sığorta",
            subTitle:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            insuranceIcon: Assets.pasha,
            status: 3,
          ),
          AppButton(
            onTap: () {
              Go.to(context, AddAsanInsuranceInfo());
            },
            child: Text("Test ucun elave et"),
          )
        ],
      ),
    );
  }
}
