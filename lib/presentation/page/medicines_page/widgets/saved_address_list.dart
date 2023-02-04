import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/medicines_page/widgets/items/saved_delivery_address_item.dart';

import '../../../../infrastructure/cubit/address/address_cubit.dart';
import '../../../../infrastructure/cubit/address/address_state.dart';
import '../../../../utils/constants/physics.dart';
import '../../../../widgets/general/app_loading.dart';
import '../../../../widgets/general/empty_widget.dart';

class SavedAddressList extends StatelessWidget {
  const SavedAddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      builder: (context, state) {
        if (state is AddressSuccess) {
          final addressList = state.addressList;
          return ListView.builder(
            shrinkWrap: true,
            physics: Physics.never,
            itemBuilder: (context, index) => SavedDeliveryAddressItem(
              address: addressList[index],
              context: context,
            ),
            itemCount: addressList.length,
          );
        }
        if (state is AddressError) {
          return EmptyWidget();
        }
        return AppLoading.big();
      },
    );
  }
}
