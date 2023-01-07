import 'package:flutter/material.dart';

class CustomFittedBox extends StatelessWidget {
  const CustomFittedBox({Key? key, required this.child, this.fit = true})
      : super(key: key);
  final Widget child;
  final bool fit;

  @override
  Widget build(BuildContext context) {
    return Center(child: fit ? FittedBox(child: child) : child);
  }
}
