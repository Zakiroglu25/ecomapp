import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:nil/nil.dart';
import 'package:uikit/infrastructure/cubit/delivery_address_current/delivery_address_current_cubit.dart';
import 'package:uikit/infrastructure/cubit/delivery_address_current/delivery_address_current_state.dart';
import 'package:uikit/presentation/page/products_page/widgets/items/current_delivery_address_item.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../../infrastructure/cubit/address/address_cubit.dart';

class CurrentDeliveryAddressButton extends StatelessWidget {
  const CurrentDeliveryAddressButton({Key? key, required this.onChange})
      : super(key: key);
  final Function? onChange;
  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onForegroundGained: () =>
          context.read<DeliveryAddressCurrentCubit>().get(),
      child: BlocConsumer<DeliveryAddressCurrentCubit,
          DeliveryAddressCurrentState>(
        listener: (context, state) {
          if (state is DeliveryAdressCurrentAdded) {
            context.read<AddressCubit>().fetch();
          }
          if (state is DeliveryAdressCurrentDisabled) {
            context
                .read<DeliveryAddressCurrentCubit>()
                .showAccessAlertForPermission(context);
          }
          if (state is DeliveryAdressCurrentServiceDisabled) {
            context
                .read<DeliveryAddressCurrentCubit>()
                .showAccessAlertForServiceEnable(context);
          }
        },
        builder: (context, state) {
          if (state is DeliveryAdressCurrentSuccess) {
            final address = state.address;
            //final location = state.location;
            return CurrentDeliveryAddressItem(
                address: address, context: context, onChange: onChange);
          }
          if (state is DeliveryAdressCurrentInProgress) {
            return nil;
          }
          if (state is DeliveryAdressCurrentDenied) {
            return CurrentDeliveryAddressItem(
                address: MyText.locationAccessDenied,
                context: context,
                onChange: onChange);
          }
          if (state is DeliveryAdressCurrentServiceDisabled) {
            return CurrentDeliveryAddressItem(
                address: MyText.locationServiceDisabled,
                context: context,
                onChange: onChange);
          }
          if (state is DeliveryAdressCurrentDisabled) {
            return CurrentDeliveryAddressItem(
                address: MyText.locationAccessDisabled,
                context: context,
                onChange: onChange);
          } else {
            return CurrentDeliveryAddressItem(
                address: MyText.locationAccessDisabled,
                context: context,
                onChange: onChange);
          }
        },
      ),
    );
  }
}
