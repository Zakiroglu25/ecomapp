import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_call_and_messenger_b_uttons.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_med_count.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_order_date.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_recipe.dart';
import 'package:uikit/presentation/page/cart_delivery_page/widgets/delivery_total_price.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/screen/snack.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/sliver_app_bar_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../infrastructure/model/response/map_medicine.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/paddings.dart';
import '../../cart_delivery_page/widgets/cart_circle_button_with_title.dart';

class MapDetailsHeaders extends StatelessWidget {
  final MapMedicine maps;

  MapDetailsHeaders({required this.maps, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var googleUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${maps.addressLat.toString()},${maps.addressLong.toString()}');
    return SliverPersistentHeader(
        floating: false,
        pinned: false,
        delegate: SliverAppDelegate(
            child: Container(
              color: MyColors.green235,
              // height: 90,
              child: FittedBox(
                fit: BoxFit.contain,
                child: SpacedColumn(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MySizedBox.h16,
                    Text(
                      maps.name!,
                      style: AppTextStyles.sfPro600s16,
                    ),
                    Text(
                      maps.addressStreetName!,
                      style: AppTextStyles.sfPro400s12,
                    ),
                    MySizedBox.h4,
                    Image.asset(Assets.demo2),
                    MySizedBox.h16,
                    Row(
                      children: [
                        Text(
                          "Bazar ertəsi - Cümə",
                          style: AppTextStyles.sfPro400s14
                              .copyWith(color: MyColors.black34),
                        ),
                        MySizedBox.w10,
                        Text(
                            "${maps.opensAtMinutes}" +
                                "${maps.opensAtHour}:00-${maps.closesAtHour}:00",
                            style: AppTextStyles.sfPro400s14
                                .copyWith(color: MyColors.green85)),
                      ],
                    ),
                    MySizedBox.h10,
                    if (maps.website != null) Text(maps.website!),
                    MySizedBox.h10,
                    Container(
                      padding: Paddings.paddingH12 + Paddings.paddingV4,
                      height: 32.h,
                      decoration: BoxDecoration(
                        color:
                            maps.isOpen! ? MyColors.green85 : MyColors.mainRED,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                          child: Text(
                        maps.isOpen! ? "Açıqdır" : "Bağlıdır",
                        style: AppTextStyles.sfPro400s16
                            .copyWith(color: MyColors.white),
                      )),
                    ),
                    MySizedBox.h8,
                    Row(
                      children: [
                        CartCircleButtonWithTitle(
                          svg: Assets.svgLoaction,
                          title: "Unvan",
                          onTap: () {
                            launch(googleUrl);
                          },
                        ),
                        MySizedBox.w24,
                        CartCircleButtonWithTitle(
                          svg: Assets.svgCall,
                          title: "Zəng et",
                        ),
                        MySizedBox.w24,
                        CartCircleButtonWithTitle(
                          svg: Assets.svgMessage,
                          title: "Messenger",
                        ),
                      ],
                    ),
                    MySizedBox.h8,
                  ],
                ),
              ),
            ),
            maxExtent_: 290));
  }

  Future<void> launch(Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : Snack.display(message: "Xeta yarandi");
  }
}
