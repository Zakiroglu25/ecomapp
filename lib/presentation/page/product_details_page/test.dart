//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'widget/image_indicator_widget.dart';
//
// class Example extends StatefulWidget {
//   @override
//   _ExampleState createState() => _ExampleState();
// }
//
// class _ExampleState extends State<Example> {
//   PageController controller = PageController();
//   int _currentIndex = 0;
//   List<String> offerImage = [
//     Assets.demoderman,
//     Assets.demoderman,
//     Assets.demoderman,
//   ];
//
//   @override
//   void initState() {
//     controller = PageController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool switchValue = true;
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: MyColors.white,
//         iconTheme: IconThemeData(color: MyColors.black0),
//       ),
//       body: ListView(
//         children: [
//           SizedBox(
//             height: 300,
//             child: Stack(
//               children: [
//                 PageView.builder(
//                   controller: controller,
//                   itemCount: offerImage.length,
//                   scrollDirection: Axis.horizontal,
//                   physics: ScrollPhysics(),
//                   onPageChanged: (index) {
//                     setState(() {
//                       _currentIndex = index;
//                     });
//                   },
//                   itemBuilder: (context, i1) {
//                     return Stack(
//                       children: [
//                         Center(
//                           child: SizedBox(
//                             height: 260,
//                             width: 260,
//                             child: Image.asset(
//                               offerImage[i1], // List of Offers precentages
//                               width: MediaQuery.of(context).size.width,
//                               colorBlendMode: BlendMode.softLight,
//                               color: Colors.black.withOpacity(0.8),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ), //  end offers
//                       ],
//                     );
//                   },
//                 ),
//                 ImageIndicatorWidget(
//                     offerPercentage: offerImage,
//                     currentIndex: _currentIndex) // end indicator
//               ],
//             ),
//           ),
//           infoText(),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(MyText.demo,
//                 style: AppTextStyles.sfPro600.copyWith(fontSize: 17.sp)),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0, right: 16),
//             child: Container(
//               height: 54.sp,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: MyColors.grey245,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text(
//                     "Sığortalı aptekləri göstər",
//                     style: AppTextStyles.sfPro400.copyWith(fontSize: 16),
//                   ),
//                   CupertinoSwitch(
//                     value: switchValue,
//                     onChanged: (bool value) {
//                       setState(() {
//                         switchValue = value;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           MySizedBox.h16,
//           Padding(
//             padding: const EdgeInsets.only(left: 16.0),
//             child: Text(
//               "QIYMƏTLƏR",
//               style: AppTextStyles.sfPro400.copyWith(color: MyColors.grey188),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: MyColors.grey245,
//               ),
//               child: Column(
//                 children: [
//                   aptek_tile(),
//                   aptek_tile(),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "İstehsal olduğu ölkə",
//                       style:
//                           AppTextStyles.sfPro400.copyWith(color: MyColors.black0),
//                     ),
//                     Text("Azərbaycan",
//                         style: AppTextStyles.sfPro400
//                             .copyWith(color: MyColors.grey130)),
//                   ],
//                 ),
//                 Divider(),
//                 MySizedBox.h12,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Məhsulun kodu",
//                       style:
//                       AppTextStyles.sfPro400.copyWith(color: MyColors.black0),
//                     ),
//                     Text("85800",
//                         style: AppTextStyles.sfPro400
//                             .copyWith(color: MyColors.grey130)),
//                   ],
//                 ),
//                 Divider(),
//                 MySizedBox.h12,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Resept",
//                       style:
//                       AppTextStyles.sfPro400.copyWith(color: MyColors.black0),
//                     ),
//                     Text("Tələb olunur",
//                         style: AppTextStyles.sfPro400
//                             .copyWith(color: MyColors.grey130)),
//                   ],
//                 ),
//                 Divider()
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget aptek_tile() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           Image.asset(Assets.zeytun),
//           MySizedBox.w12,
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "370 ₼ ",
//                 style: AppTextStyles.sfPro600
//                     .copyWith(fontSize: 17, color: MyColors.black34),
//               ),
//               Text(
//                 "19 ₼/ay. ",
//                 style: AppTextStyles.sfPro400
//                     .copyWith(fontSize: 17, color: MyColors.black34),
//               ),
//               Text("Zeytun aptek",
//                   style: AppTextStyles.sfPro400
//                       .copyWith(fontSize: 17, color: MyColors.mainRed)),
//             ],
//           ),
//           Spacer(),
//           DoctoroButton(
//             borderRadius: 99,
//             w: 109,
//             h: 36,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.shopping_cart_rounded,
//                   color: MyColors.white,
//                 ),
//                 Text(
//                   "Sebete",
//                   style: AppTextStyles.sfPro400.copyWith(color: MyColors.white),
//                 ),
//               ],
//             ),
//             color: MyColors.green,
//           )
//         ],
//       ),
//     );
//   }
//
//   Container infoText() {
//     return Container(
//       height: 80,
//       color: MyColors.red250,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(Icons.info_outline),
//           SizedBox(width: 270, child: Text(MyText.demo1)),
//           Icon(Icons.clear)
//         ],
//       ),
//     );
//   }
// }
