import 'package:flutter/material.dart';
import 'package:uikit/utils/typedefs/scrolly_builder.dart';

//   const Pagenatible({Key key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class Pagenitable extends StatelessWidget {
  Pagenitable({Key? key, required this.child, this.onBottom}) : super(key: key);
  Function? onBottom;
  ScrollyBuilder child;

  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 10) {
          //BlocProvider.of<ProductsCubit>(context).loadMore();
          onBottom?.call();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    //  BlocProvider.of<ProductOptionCubit>(context).loadMore();
    return child(scrollController);
  }
}
