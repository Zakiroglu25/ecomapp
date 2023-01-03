import 'package:intl/intl.dart';
import 'package:uikit/utils/extensions/object.dart';

extension StringDate on String? {
  String get formatDateTimeFromUtc {
    if (this.isNotNull) {
      return DateFormat("dd.MM.yyyy")
          .format(DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(this!));
    } else {
      return DateFormat("dd.MM.yyyy").format(DateTime.now());
    }
  }
}
