import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uikit/infrastructure/model/response/address_model.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/sized_box.dart';

import '../../../../infrastructure/cubit/address/address_cubit.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/border_radius.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/delegate/index.dart';
import '../../../../utils/screen/ink_wrapper.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({Key? key, required this.address}) : super(key: key);
  final Address address;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Go.to(
          context,
          Pager.addAddress(
              address: address,
              context: context,
              lat: address.latitude,
              long: address.longitude,
              title: address.title)),
      child: Slidable(
        key: UniqueKey(),
        endActionPane: ActionPane(
          extentRatio: 0.20,
          motion: const ScrollMotion(),
          children: [
            InkWrapper(
              onTap: () => context
                  .read<AddressCubit>()
                  .delete(address.guid!, loading: false, context: context),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: Radiuses.r12, color: MyColors.darkRED),
                width: 55,
                height: 48,
                child: Center(
                  child: SvgPicture.asset(
                    Assets.svgTrash,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        child: Padding(
          padding: Paddings.paddingH16 + Paddings.paddingV12,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${address.title}",
                      style: AppTextStyles.sfPro600s16,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    MySizedBox.h4,
                    Container(
                      //  color: MyColors.brand,
                      child: Text(
                        address.streetName ?? '',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyles.sfPro400s14
                            .copyWith(color: MyColors.grey158),
                      ),
                    ),
                  ],
                ),
              ),
              //Spacer(),
              SvgPicture.asset(Assets.svgEdit)
            ],
          ),
        ),
      ),
    );
  }
}
