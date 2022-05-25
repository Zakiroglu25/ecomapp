//
// import 'package:flutter/material.dart';
//
// import '../../util/constants/colors.dart';
//
// class CaspaLoading extends StatelessWidget {
//   Color? color;
//   double? s;
//
//   CaspaLoading({this.color,this.s});
//
//   CaspaLoading.blue({this.color = MyColors.mainColor});
//
//   CaspaLoading.white({this.color = MyColors.white});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: s??null,
//       width: s??null,
//       child: Center(
//           child: FadeIn(
//         duration: Duration(milliseconds: 800),
//         child: WidgetOrEmpty(
//           value: color==null,
//           elseChild: Container(width: 20,height: 20,child: CircularProgressIndicator(color: color,)),
//           child: Container(
//             height: 25,
//             width: 25,
//             // color: Colors.green,
//           ),
//         ),
//       )),
//     );
//   }
// }
