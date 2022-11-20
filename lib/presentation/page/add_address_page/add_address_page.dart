import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/add_address/add_and_update_address_cubit.dart';
import 'package:uikit/infrastructure/cubit/add_address/add_and_updtae_address_state.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/custom/app_button.dart';

import '../../../infrastructure/model/response/address_model.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/string_operations.dart';
import '../../../utils/screen/snack.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../../../widgets/general/app_field.dart';
import 'fields/address_field.dart';
import 'fields/courier_desc_field.dart';
import 'fields/name_address_field.dart';
import 'fields/phone_field.dart';
import 'fields/region_field.dart';
import 'fields/title_fields.dart';

class AddAddressPage extends StatelessWidget {
  final AddressModel? addressModel;
  double? lat;
  double? lng;
  TextEditingController? textController = TextEditingController();

  AddAddressPage({this.addressModel, this.lat, this.lng, this.textController});

  bool first = true;

  @override
  Widget build(BuildContext context) {
    final addAttorneysCubit = context.watch<AddAddressCubit>();

    if (addressModel != null && first) {
      addAttorneysCubit.cityController.text = addressModel!.city!;
      addAttorneysCubit.houseNumberController.text = addressModel!.houseNumber!;
      addAttorneysCubit.phoneController.text = addressModel!.phone!;
      addAttorneysCubit.countryController.text = addressModel!.country!;
      addAttorneysCubit.latitudeController.text = addressModel!.latitude!;
      addAttorneysCubit.longitudeController.text = addressModel!.longitude!;
      addAttorneysCubit.descriptionController.text = addressModel!.description!;
      first = false;
    }
    return Scaffold(
      appBar: DoctorAppbar(
        user: false,
        notification: false,
        addressDropdown: false,
        contextA: context,
        title: "Yeni ünvan yarat",
      ),
      body: BlocListener<AddAddressCubit, AddAddressState>(
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
          padding: EdgeInsets.all(16),
          children: [
            AddressField(
              controller:
                  textController == null ? textController : textController,
            ),
            NameAddressField(
              controller: addAttorneysCubit.titleCnt,
            ),
            TitleField(
              controller: addAttorneysCubit.cityController,
            ),
            RegionField(
              controller: addAttorneysCubit.countryController,
            ),
            CourierDescField(
              controller: addAttorneysCubit.descriptionController,
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
              text: "Yadda Saxla",
            )
            // AddressField()
          ],
        ),
      ),
    );
  }
}
