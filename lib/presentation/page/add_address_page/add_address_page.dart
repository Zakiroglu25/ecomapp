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
  TextEditingController? textController = TextEditingController();

  AddAddressPage({this.addressModel, this.lat, this.lng, this.textController});

  bool first = true;

  @override
  Widget build(BuildContext context) {
    final addAddressCubit = context.watch<AddAddressCubit>();

    if (addressModel != null && first) {
      addAddressCubit.cityController.text = addressModel!.city!;
      addAddressCubit.houseNumberController.text = addressModel!.houseNumber!;
      addAddressCubit.phoneController.text = addressModel!.phone!;
      addAddressCubit.countryController.text = addressModel!.country!;
      addAddressCubit.latitudeController.text = addressModel!.latitude!;
      addAddressCubit.longitudeController.text = addressModel!.longitude!;
      addAddressCubit.descriptionController.text = addressModel!.description!;
      first = false;
    }

    return Cupperfold(
      title: MyText.addNewAddress,
      showAppbarLittleText: true,
      user: false,
      child: BlocListener<AddAddressCubit, AddAddressState>(
        listener: (context, state) {
          if (state is AddAddressSuccess) {
            Go.pop(context);
            Snack.display(
                context: context,
                message: MyText.success,
                positive: true,
                showSuccessIcon: true);
          } else if (state is AddAddressError) {
            // Go.pop(context);
            Snack.display(
              context: context,
              message: MyText.error,
            );
          }
        },
        child: ListView(
          padding: Paddings.paddingH16,
          shrinkWrap: true,
          children: [
            AddressField(
              controller: textController ?? textController,
            ),
            NameAddressField(
              controller: addAddressCubit.titleCnt,
            ),
            TitleField(
              controller: addAddressCubit.cityController,
            ),
            RegionField(
              controller: addAddressCubit.countryController,
            ),
            CourierDescField(
              controller: addAddressCubit.descriptionController,
            ),

            MySizedBox.h50,
            AppButton(
              isButtonActive: lng == null ? false : true,
              loading:
                  context.read<AddAddressCubit>().state is AddAddressInProgress,
              onTap: () {
                addressModel != null
                    ? context.read<AddAddressCubit>().editAddress(addressModel!)
                    : context.read<AddAddressCubit>().addAddress(
                        context: context,
                        lat: lat,
                        lng: lng,
                        streetNameController: textController);
              },
              text: MyText.save,
            )
            // AddressField()
          ],
        ),
      ),
    );
  }
}
