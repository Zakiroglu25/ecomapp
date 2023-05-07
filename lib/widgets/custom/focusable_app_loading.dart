import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

import '../general/app_loading.dart';

class FocusableAppLoading extends StatelessWidget {
  const FocusableAppLoading({Key? key, required this.onFocus})
      : super(key: key);
  final VoidCallback? onFocus;
  @override
  Widget build(BuildContext context) {
    return FocusDetector(onFocusGained: onFocus, child: AppLoading());
  }
}
