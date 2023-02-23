import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/add_address/add_and_update_address_cubit.dart';
import 'package:uikit/infrastructure/cubit/add_address/add_and_updtae_address_state.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/custom/app_button.dart';
import 'package:uikit/widgets/main/cupperfold/cupperfold.dart';

import '../../../infrastructure/model/response/address_model.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/screen/snack.dart';
import 'fields/address_field.dart';
import 'fields/courier_desc_field.dart';
import 'fields/name_address_field.dart';
import 'fields/region_field.dart';
import 'fields/title_fields.dart';

class AddAddressPage extends StatelessWidget {
  final Address? addressModel;
  double? lat;
  double? lng;
  String? title;

  TextEditingController? textController = TextEditingController();

  AddAddressPage(
      {this.addressModel, this.lat, this.lng, this.textController, this.title});

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      title: MyText.addNewAddress,
      showAppbarLittleText: true,
      user: false,
      child: BlocListener<AddAddressCubit, AddAddressState>(
        listener: (context, state) {
          if (state is AddAddressSuccess) {
            Go.pop(context);
            Snack.showOverlay(
                context: context,
                message: MyText.success,
                positive: true,
                showSuccessIcon: true);
          } else if (state is AddAddressError) {
            // Go.pop(context);
            Snack.showOverlay(
              context: context,
              message: state.error.toString(),
            );
          }
        },
        child: ListView(
          padding: Paddings.paddingH16,
          shrinkWrap: true,
          children: [
            AddressField(
              controller:
                  TextEditingController(text: addressModel?.streetName ?? ''),
            ),
            NameAddressField(
              controller:
                  TextEditingController(text: addressModel?.title ?? ''),
            ),
            TitleField(
              controller: TextEditingController(text: addressModel?.city ?? ''),
            ),
            RegionField(
              controller:
                  TextEditingController(text: addressModel?.country ?? ''),
            ),
            CourierDescField(
              controller:
                  TextEditingController(text: addressModel?.description ?? ''),
            ),
            MySizedBox.h50,
            StreamBuilder(
                stream: BlocProvider.of<AddAddressCubit>(context).addressActive,
                builder: (context, snapshot) {
                  return AppButton(
                    isButtonActive:
                        context.read<AddAddressCubit>().isAddressValid(),
                    loading: context.read<AddAddressCubit>().state
                        is AddAddressInProgress,
                    onTap: () {
                      addressModel != null
                          ? context.read<AddAddressCubit>().editAddress(
                                address: addressModel!,
                                context: context,
                                lat: lat,
                                lng: lng,
                                guid: addressModel!.guid,
                              )
                          : context.read<AddAddressCubit>().addAddress(
                                context: context,
                                lat: lat,
                                lng: lng,
                              );
                    },
                    text: MyText.save,
                  );
                }),

            // AddressField()
          ],
        ),
      ),
    );
  }
}
