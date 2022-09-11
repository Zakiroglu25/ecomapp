import 'package:doctoro/infrastructure/config/init.dart';
import 'package:flutter/material.dart';

import 'mate_app.dart';

void main() async {
  await init();
  runApp(const MateApp());
}
