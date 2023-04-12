import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/presentation/page/cart_order_details_page/widgets/cart_circle_button_with_title.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/screen/snack.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/sliver_app_bar_delegate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../infrastructure/model/response/map_medicine.dart';
import '../../../../infrastructure/services/navigation_service.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/text.dart';
import '../../../../utils/screen/alert.dart';
import '../../../../utils/screen/errorable_image.dart';

class MapDetailsHeaders extends StatelessWidget {
  final MapMedicine maps;

  MapDetailsHeaders({required this.maps, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var googleUrl = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${maps.addressLat.toString()},${maps.addressLong.toString()}');

    return Container(
        color: MyColors.secondary,
        // height: 90,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MySizedBox.h30,
              Text(
                maps.name!,
                style: AppTextStyles.sfPro600s16,
              ),
              Text(
                maps.addressStreetName!,
                style: AppTextStyles.sfPro400s12,
              ),
              MySizedBox.h4,
              ErrorableImage(
                backColor: MyColors.white,
                imageUrl: maps.imageUrl,
                w: 72,
                h: 72,
                r: 99,
              ),
              MySizedBox.h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          .copyWith(color: MyColors.mainGreen85)),
                ],
              ),
              MySizedBox.h10,
              if (maps.website != null) Text(maps.website!),
              MySizedBox.h10,
              Container(
                padding: Paddings.paddingH12 + Paddings.paddingV4,
                height: 32.h,
                width: 90.w,
                decoration: BoxDecoration(
                  // color: maps.isOpen! ? MyColors.mainGreen85 : MyColors.mainRED,
                  color: MyColors.brand,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                    child: Text(
                  maps.isOpen! ? "Açıqdır" : "Bağlıdır",
                  style:
                      AppTextStyles.sfPro400s16.copyWith(color: MyColors.white),
                )),
              ),
              MySizedBox.h16,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CartCircleButtonWithTitle(
                    svg: Assets.svgLoaction,
                    title: "Unvan",
                    onTap: () {
                      launch1(googleUrl);
                      print(maps.guid);
                    },
                  ),
                  MySizedBox.w24,
                  CartCircleButtonWithTitle(
                    svg: Assets.svgCall,
                    title: "Zəng et",
                    onTap: () => launch(("tel://" + maps.phone.toString())),
                  ),
                ],
              ),
              MySizedBox.h8,
            ]));
  }

  Future<void> launch1(Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : Alert.show(NavigationService.instance.navigationKey!.currentContext!,
            //content: MyText.networkError,
            title: MyText.error,
            mainButtonColor: MyColors.brand);
    ;
  }

  Future<void> call(Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url)
        : Alert.show(NavigationService.instance.navigationKey!.currentContext!,
            //content: MyText.networkError,
            title: MyText.error,
            mainButtonColor: MyColors.brand);
  }
}
