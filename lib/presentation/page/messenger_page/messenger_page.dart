import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/text.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import 'widget/body_messenger.dart';

class MessengerPage extends StatelessWidget {
  const MessengerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Cupperfold(
      user: false,
      notification: true,
      title: MyText.messenger,
      child: BodyMessenger(),
    );
  }
}
