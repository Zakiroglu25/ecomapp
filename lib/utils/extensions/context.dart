import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get sW => MediaQuery.of(this).size.width;
  double get sH => MediaQuery.of(this).size.height;

  double dynamicW(double value) => MediaQuery.of(this).size.width * value;
  double dynamicH(double value) => MediaQuery.of(this).size.height * value;
}
