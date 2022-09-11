import 'package:flutter/material.dart';

class SliverAppDelegate extends SliverPersistentHeaderDelegate {
  SliverAppDelegate(
      {required this.child, required this.maxExtent_, this.minExtent_});

  final Widget child;
  final double? minExtent_;
  final double maxExtent_;

  @override
  double get minExtent => minExtent_ ?? 0;

  @override
  double get maxExtent => maxExtent_;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      color: Colors.white,
      child: child,
    );
  }

  //test

  @override
  bool shouldRebuild(SliverAppDelegate oldDelegate) {
    return true;
  }
}
