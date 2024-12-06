import 'package:uikit/utils/extensions/index.dart';

extension StringExtension on String? {
  bool get isNotNullOrEmpty => isNotNull && this!.isNotEmpty;

}
