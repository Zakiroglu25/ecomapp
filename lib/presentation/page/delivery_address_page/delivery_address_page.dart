import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';

import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/delegate/random.dart';
import 'package:uikit/utils/extensions/context.dart';
import 'package:uikit/widgets/custom/app_tab.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/text_title_big.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../utils/constants/paddings.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/custom/sliver_app_bar_delegate.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wp.dart';
import 'widget/static_delivery_field.dart';

class DeliveryAddressPage extends StatelessWidget {
  const DeliveryAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupperTabWP(
      user: false,
      notification: false,
      showAppbarLittleText: true,
      child: Container(
        color: Rndm.color,
      ),
      title: "Ödəniş və çatdırılma",
      tabbarTitle: SliverAppDelegate(
          child: Padding(
            padding: Paddings.paddingH16 + Paddings.paddingV8,
            child: const Text(
              MyText.chooseDeliveryType,
              style: AppTextStyles.sfPro600s16,
            ),
          ),
          maxExtent_: 46),
      tabPages: [
        ///tab1
        Container(
          padding: Paddings.paddingA16,
          child: ListView(children: [
            const StaticDeliveryWidget(),
            AppField(
              title: MyText.contactNumber,
              hint: "Əlaqə nömrəsini daxil edin",
            ),
            BigSection(
              title: "Ünvan",
              size: 16.sp,
            ),
            MySizedBox.h24,
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              height: 200,
              child: GoogleMap(
                zoomGesturesEnabled: false,
                myLocationEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(43.400, 43.333), //initial position
                  zoom: 13.0, //initial zoom level
                ),
                // onTap: (position) {
                //   _customInfoWindowController.hideInfoWindow!();
                // },
                // onCameraMove: (position) {
                //   _customInfoWindowController.onCameraMove!();
                // },
                // markers: markers,
                //markers to show on map
                mapType: MapType.normal,
                //map type
                // onMapCreated: (GoogleMapController controller) async {
                //   _customInfoWindowController.googleMapController =
                //       controller;
                // },
              ),
            ),
            MySizedBox.h16,
            AppField(
              title: "Rayon",
            ),
            AppField(
              title: "Ünvan",
            ),
            AppField(
              title: MyText.note,
            ),
            BigSection(
              title: "Ödəniş",
              size: 16.sp,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: MyColors.grey245,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sifarişlər:",
                        style: AppTextStyles.sfPro400s16,
                      ),
                      Text("142.20 ₼"),
                    ],
                  ),
                  MySizedBox.h20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Çatdırılma haqqı:",
                        style: AppTextStyles.sfPro400s16,
                      ),
                      Text("16.10 ₼"),
                    ],
                  ),
                  MySizedBox.h20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Toplam:",
                        style: AppTextStyles.sfPro400s16,
                      ),
                      AppButton.black(
                        w: 104,
                        text: '1 223.20  ₼',

                        // onTap: () => Go.to(context, Pager.cartDelivery),
                      ),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),

        ///tab2
        Text("Salam")
      ],
      tabs: [
        AppTab(
          text: "Çatdırılma",
        ),
        AppTab(
          text: "Özüm götürəcəm",
        ),
      ],
    );
  }
}
