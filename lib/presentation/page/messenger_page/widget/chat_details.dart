import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:uikit/infrastructure/cubit/chat_messages_cubit/chat_messenger_cubit.dart';
import 'package:uikit/infrastructure/cubit/chat_messages_cubit/chat_messenger_state.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/general/empty_widget.dart';

import '../../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../../../../widgets/general/app_loading.dart';
import '../../../../widgets/general/pagenatible.dart';
import 'chat_sent_field.dart';
import 'chat_words_widget.dart';
import 'doctoro_logo_little.dart';

class ChatPage extends StatelessWidget {
  String? guid;
  String? storeName;

  ChatPage({this.guid, required this.storeName});

  TextEditingController controller = TextEditingController();
  final ScrollController _sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ChatMessengerCubit>(context).loadMore(guid!);
    return Scaffold(
      appBar: DoctorAppbar(
        title: storeName,
        notification: false,
        user: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ChatMessengerCubit, ChatMessengerState>(
          builder: (context, state) {
            if (state is ChatMessengerSuccess) {
              var chatList = state.contactList;
              // if (chatList.data!.isEmpty) {
              //   return Text("salam");
              // }
              return Stack(
                children: [
                  SizedBox(
                    // height: MediaQuery.of(context).size.height / 2,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(bottom: 80),
                      shrinkWrap: false,
                      controller: _sc,
                      itemCount: chatList.data!.length,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: chatList.data![index].isByYou == true
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (chatList.data![index].isByYou == false)
                                  const DoctoroChatLogo(),
                                MySizedBox.w12,
                                ChatWordsWidget(
                                    date:
                                        chatList.data![index].sentAt.toString(),
                                    message: chatList.data![index].message!),
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
              return const AppLoading();
            }
            return AppLoading();
          },
        ),
      ),
    );
  }
}
