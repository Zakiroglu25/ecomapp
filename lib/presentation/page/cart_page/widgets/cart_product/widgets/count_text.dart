import 'package:flutter/material.dart';

class CountText extends StatelessWidget {
  const CountText({Key? key, required this.count}) : super(key: key);
  final num? count;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 36, width: 36, child: Center(child: Text("$count")));
  }
}
