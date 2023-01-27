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
  final scrollController = ScrollController();
  final int messageCount = 1;

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 10) {
          BlocProvider.of<ChatMessengerCubit>(context).loadMore(guid!);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<ChatMessengerCubit>(context).loadMore(guid!);
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
                        controller: scrollController,
                        padding: const EdgeInsets.only(bottom: 80),
                        reverse: true,
                        shrinkWrap: false,
                        itemCount: chatList.length,
                        itemBuilder: (context, index) {
                          return index == chatList.length ?AppLoading():Align(
                            alignment: chatList[index].isByYou == true
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (chatList[index].isByYou == false)
                                    const DoctoroChatLogo(),
                                  MySizedBox.w12,
                                  ChatWordsWidget(
                                      date: chatList[index].sentAt.toString(),
                                      message: chatList[index].message!),
                                  MySizedBox.w12,
                                ]),
                          ) ;
                        },
                      ),
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
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../infrastructure/cubit/chat_messages_cubit/chat_messenger_cubit.dart';
// import '../../../../infrastructure/cubit/chat_messages_cubit/chat_messenger_state.dart';
// import '../../../../widgets/general/app_loading.dart';
// import 'chat_sent_field.dart';
//
// class Chat extends StatelessWidget {
//   String? guid;
//   String? storeName;
//
//   Chat(this.guid, this.storeName);
//
//   TextEditingController controller = TextEditingController();
//
//   final scrollController = ScrollController();
//
//   void setupScrollController(context) {
//     scrollController.addListener(() {
//       if (scrollController.position.atEdge) {
//         if (scrollController.position.pixels != 10) {
//           BlocProvider.of<ChatMessengerCubit>(context).loadMore(guid!);
//         }
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     setupScrollController(context);
//     BlocProvider.of<ChatMessengerCubit>(context).loadMore(guid!);
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: BlocProvider(
//         create: (context) => ChatMessengerCubit()..fetch(context: context, guid: guid!),
//         child: BlocBuilder<ChatMessengerCubit, ChatMessengerState>(
//           builder: (context, state) {
//             if (state is ChatMessengerSuccess) {
//               var chatList = state.contactList;
//               return Container(
//                 height: 300,
//                 child: ListView.builder(
//                   controller: scrollController,
//                   reverse: false,
//                   shrinkWrap: true,
//                   itemCount: chatList.length > 1 ? chatList.length:chatList.length+1,
//                   itemBuilder: (BuildContext context, int index) {
//                     return FadeTransition(
//                       opacity: CurvedAnimation(
//                           parent: const AlwaysStoppedAnimation(1),
//                           curve: Curves.easeIn),
//                       child: Row(
//                         mainAxisAlignment: chatList[index].isByYou == false
//                             ? MainAxisAlignment.start
//                             : MainAxisAlignment.end,
//                         children: <Widget>[
//                           Container(
//                             padding: const EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                                 color: chatList[index].isByYou == false
//                                     ? Colors.blue[50]
//                                     : Colors.green[50],
//                                 borderRadius: BorderRadius.only(
//                                     topRight: const Radius.circular(10),
//                                     bottomLeft: const Radius.circular(10),
//                                     bottomRight:
//                                     chatList[index].isByYou == false
//                                         ? const Radius.circular(10)
//                                         : const Radius.circular(0),
//                                     topLeft:
//                                     chatList[index].isByYou == false
//                                         ? const Radius.circular(0)
//                                         : const Radius.circular(10))),
//                             child: Text(chatList[index].message!),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               );
//             }
//             return const Text("Salam");
//           },
//         ),
//       ),
//     );
//     // body: BlocProvider(
//     //   create: (context) =>
//     //       ChatMessengerCubit()..fetch(context: context, guid: guid!),
//     //   child: BlocBuilder<ChatMessengerCubit, ChatMessengerState>(
//     //     builder: (context, state) {
//     //       if (state is ChatMessengerSuccess) {
//     //         var chatList = state.contactList;
//     //
//     //       } else if (state is ChatMessengerInProgress) {
//     //         return const AppLoading();
//     //       }
//     //       return const AppLoading();
//     //     },
//     //   ),
//     // ),
//
//   }
// }
