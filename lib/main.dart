import 'package:flutter/material.dart';
import 'package:uikit/infrastructure/config/init.dart';

import 'mate_app.dart';

void main() async {
  await init();
  runApp(const MateApp());
}
