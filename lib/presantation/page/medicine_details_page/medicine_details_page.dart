import 'package:doctoro/util/constants/colors.dart';
import 'package:doctoro/util/constants/sized_box.dart';
import 'package:doctoro/util/constants/text.dart';
import 'package:doctoro/widget/custom/doctoro_button.dart';
import 'package:doctoro/widget/doctoro_appbar/doctoro_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../../util/constants/assets.dart';
import '../../../util/constants/paddings.dart';
import '../../../widget/general/doctoro_field.dart';
import '../favorite_page/widget/fovorite_item.dart';

class MedicineDetailsPage extends StatelessWidget {
  const MedicineDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: "Dermanlar",
        contextA: context,
        user: false,
        notification: true,
        filter: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            DoctoroField(
              hint: "Dərman axtar",
              suffixIcon: SvgPicture.asset(Assets.svgSearch),
            ),
            SizedBox(
                height: 48.0,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      width: 108.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(36.0),
                        color: MyColors.grey245,
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.svgFav),
                          MySizedBox.w10,
                          Text("Hamisi")
                        ],
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                )),
            ListItemWidget()
          ],
        ),
      ),
    );
  }
}
