import 'package:uikit/utils/extensions/index.dart';

extension Number on String? {
  String get formatWith070 => isNotNull
      ? this!.replaceAll("+", '').replaceAllMapped(
          RegExp(r'(\d{3})(\d{2})(\d{3})(\d{2})(\d+)'),
          (Match m) => "(0${m[2]}) ${m[3]} ${m[4]} ${m[5]}")
      : '';
}
