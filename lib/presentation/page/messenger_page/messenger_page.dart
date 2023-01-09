import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/constants/text.dart';
import '../../../infrastructure/cubit/messenger_cubit/messenger_cubit.dart';
import '../../../infrastructure/cubit/messenger_cubit/messenger_state.dart';
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

              return BodyMessenger(list:state.contactList);
            }else if(state is MessengerError){
              return Center(
                child: Text("Error"),
              );
            }
            return Center(
              child: Text("Alinmadi"),
            );
          },
        ),
      ),
    );
  }
}
