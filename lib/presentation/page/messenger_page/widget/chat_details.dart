import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/chat_messages_cubit/chat_messenger_cubit.dart';
import 'package:uikit/infrastructure/cubit/chat_messages_cubit/chat_messenger_state.dart';
import 'package:uikit/utils/constants/sized_box.dart';

import '../../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../../../../widgets/general/app_loading.dart';
import '../../../../widgets/general/pagenatible.dart';
import 'chat_sent_field.dart';
import 'chat_words_widget.dart';
import 'doctoro_logo_little.dart';

class Chat extends StatelessWidget {
  String? guid;
  String? storeName;

  Chat(this.guid, this.storeName);

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ChatMessengerCubit>(context).loadMore(guid!);
    return Paginatible(
      onBottom: () =>
          BlocProvider.of<ChatMessengerCubit>(context).loadMore(guid!),
      child: (scrollController) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
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
                          height: MediaQuery.of(context).size.height / 2,
                          child: StreamBuilder<bool>(
                              stream:
                                  BlocProvider.of<ChatMessengerCubit>(context)
                                      .haveElseStream,
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  controller: scrollController,
                                  padding: const EdgeInsets.only(bottom: 80),
                                  reverse: true,
                                  shrinkWrap: false,
                                  itemCount: snapshot.data ?? false
                                      ? chatList.length + 1
                                      : chatList.length,
                                  itemBuilder: (context, index) {
                                    return index == chatList.length
                                        ? const AppLoading()
                                        : Align(
                                            alignment:
                                                chatList[index].isByYou == true
                                                    ? Alignment.centerRight
                                                    : Alignment.centerLeft,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  if (chatList[index].isByYou ==
                                                      false)
                                                    const DoctoroChatLogo(),
                                                  MySizedBox.w12,
                                                  ChatWordsWidget(
                                                      date: chatList[index]
                                                          .sentAt
                                                          .toString(),
                                                      message: chatList[index]
                                                          .message!),
                                                  MySizedBox.w12,
                                                ]),
                                          );
                                  },
                                );
                              }),
                        ),
                        ChatSendTextField(controller: controller, guid: guid)
                      ],
                    );
                  } else if (state is ChatMessengerInProgress) {
                    return const AppLoading();
                  }
                  return const AppLoading();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
