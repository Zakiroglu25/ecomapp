import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../infrastructure/cubit/chat_messages_cubit/chat_messenger_cubit.dart';
import '../../../../infrastructure/cubit/chat_messages_cubit/chat_messenger_state.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/screen/snack.dart';
import '../../../../widgets/general/app_loading.dart';

class ChatSendTextField extends StatelessWidget {
  const ChatSendTextField({
    Key? key,
    required this.controller,
    required this.guid,
  }) : super(key: key);

  final TextEditingController controller;
  final String? guid;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: MyColors.field_grey,
                    borderRadius: BorderRadius.circular(99)),
                child: TextField(
                  minLines: 1,
                  //Normal textInputField will be displayed
                  maxLines: 5,
                  controller: controller,

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        new EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (controller.text.length > 4) {
                  context
                      .read<ChatMessengerCubit>()
                      .sendMessage(message: controller.text);
                  controller.clear();
                } else {
                  Snack.showOverlay(
                      context: context,
                      message: "Xarakter sayi 5den boyuk olmalidir.");
                }
              },
              child: BlocListener<ChatMessengerCubit, ChatMessengerState>(
                listener: (context, state) {
                  if (state is ChatMessengerInProgress) {
                    AppLoading();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.send,
                    color: Colors.green,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
