import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/chat_messages_cubit/chat_messenger_cubit.dart';
import 'package:uikit/infrastructure/cubit/chat_messages_cubit/chat_messenger_state.dart';
import 'package:uikit/utils/constants/sized_box.dart';

import '../../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../../../../widgets/general/app_loading.dart';
import 'chat_sent_field.dart';
import 'chat_words_widget.dart';
import 'doctoro_logo_little.dart';

class Chat extends StatelessWidget {
  String? guid;
  String? storeName;

  Chat(this.guid, this.storeName);

  TextEditingController controller = TextEditingController();

  final int messageCount = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: storeName,
        notification: false,
        user: false,
        contextA: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) =>
              ChatMessengerCubit()..fetch(context: context, guid: guid!),
          child: BlocBuilder<ChatMessengerCubit, ChatMessengerState>(
            builder: (context, state) {
              if (state is ChatMessengerSuccess) {
                var chatList = state.contactList;
                return Stack(
                  children: [
                    SizedBox(
                      child: ListView.builder(
                        reverse: false,
                        shrinkWrap: true,
                        itemCount: chatList.length,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: chatList[index].isByYou == true
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child:
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min, children: [
                              if (chatList[index].isByYou == false)
                                const DoctoroChatLogo(),
                              MySizedBox.w12,
                              ChatWordsWidget(message: chatList[index].message!),
                              MySizedBox.w12,
                            ]),
                          );
                        },
                      ),
                    ),
                    ChatSendTextField(controller: controller, guid: guid)
                  ],
                );
              } else if (state is ChatMessengerInProgress) {
                return AppLoading();
              }
              return AppLoading();
            },
          ),
        ),
      ),
    );
  }
}



