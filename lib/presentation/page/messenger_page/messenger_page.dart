import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/general/empty_widget.dart';

import '../../../infrastructure/cubit/messenger_cubit/messenger_cubit.dart';
import '../../../infrastructure/cubit/messenger_cubit/messenger_state.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../widgets/general/app_loading.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import 'widget/body_messenger.dart';

class MessengerPage extends StatelessWidget {
  const MessengerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      user: false,
      notification: true,
      title: MyText.messenger,
      child: BlocProvider(
        create: (context) => MessengerCubit()..fetch(),
        child: BlocBuilder<MessengerCubit, MessengerState>(
          builder: (context, state) {
            if (state is MessengerSuccess) {
              if (state.contactList.isEmpty) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: EmptyWidget(
                    imageUrl: Assets.pngChat,
                    color: MyColors.blue157,
                    text: MyText.emptyText,
                    description: MyText.emptyMessenger,
                  ),
                );
              }
              return BodyMessenger(list: state.contactList);
            } else if (state is MessengerError) {
              return Center(
                child: Text("Bilinmeyen Xeta"),
              );
            } else if (state is MessengerInProgress) {
              return AppLoading();
            }
            return EmptyWidget(
              imageUrl: Assets.pngMessenger3x,
            );
          },
        ),
      ),
    );
  }
}
