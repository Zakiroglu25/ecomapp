import 'package:flutter/material.dart';

class CartOrderStatus {
  String text;
  Color color;
  String statusIcon;
  Color? statusIconColor;

  CartOrderStatus({
    required this.text,
    required this.color,
    required this.statusIcon,
    this.statusIconColor,
  });
}
