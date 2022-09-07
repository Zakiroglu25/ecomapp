import 'package:doctoro/infrastructure/config/init.dart';
import 'package:flutter/material.dart';

import 'mate_app.dart';

void main() async {
  await init();
  runApp(const MateApp());
}

mixin InitStateMixin<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    print("$T sehifesi açıldı.");
    super.initState();
  }
}
