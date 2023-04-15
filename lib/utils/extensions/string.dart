import 'package:flutter/material.dart';
import 'package:uikit/utils/extensions/index.dart';
import 'package:uikit/widgets/general/manat_price.dart';

extension StringExtension on String? {
  bool get isNotNullOrEmpty => isNotNull && this!.isNotEmpty;

}
