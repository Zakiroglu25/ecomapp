import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/delivery_and_payment/delivery_and_payment_cubit.dart';
import '../../../../../infrastructure/cubit/user/user_cubit.dart';
import '../../../../../utils/constants/text.dart';
import '../../../../../widgets/general/app_field.dart';

class DeliveryAndPaymentCommentField extends StatelessWidget {
  const DeliveryAndPaymentCommentField({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: BlocProvider.of<DeliveryAndPaymentCubit>(context).commentStream,
      builder: (context, snapshot) {
        return AppField(
          title: MyText.note,
          hint: MyText.note,
          textInputType: TextInputType.name,
          textCapitalization: TextCapitalization.none,
          //   errorMessage: snapshot.error == null ? null : '${snapshot.error}',
          onChanged: (value) =>
              BlocProvider.of<DeliveryAndPaymentCubit>(context)
                  .updateComment(value),
        );
      },
    );
  }
}
