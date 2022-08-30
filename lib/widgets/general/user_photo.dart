// import 'dart:io';
//
// import 'package:animate_do/animate_do.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:rxdart/rxdart.dart';
// import '../../utils/constants/colors.dart';
// import '../../utils/constants/text.dart';
// import '../../utils/delegate/navigate_utils.dart';
// import '../../utils/screen/ink_wrapper.dart';
// import '../../utils/screen/widget_or_empty.dart';
//
// class UserPhoto extends StatelessWidget {
//   double? h;
//   double? w;
//   String? url;
//   bool editOnTap;
//   UserPhoto({this.h, this.w, this.url, this.editOnTap = false});
//
//   // HiveService get _prefs => locator<HiveService>();
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<File?>(
//       // stream: BlocProvider.of<UserCubit>(context).imageStream,
//       builder: (context, snapshot) {
//         // BehaviorSubject<File?> image = context.read<UserCubit>().image;
//         return InkWrapper(
//           tapable: editOnTap,
//           splashColor: MyColors.transparent,
//           highlightColor: MyColors.transparent,
//           onTap: () {
//             if (editOnTap) {
//               // Alert.body(context,
//               //     buttonText: MyText.gallery,
//               //     textAlign: TextAlign.center,
//               //     title: MyText.youMustSelectOneOfThem,
//               //     image: MySizedBox.h16,
//               //     onTap: () =>
//               //         context.read<UserCubit>().checkAndPickImage(context),
//               //     secondButton: CaspaButton(
//               //       onTap: () {
//               //         Go.pop(context);
//               //         context.read<UserCubit>().checkAndTake(context);
//               //       },
//               //       text: MyText.camera,
//               //     ));
//             }
//           },
//           child: Container(
//               height: h ?? 100.sp,
//               width: w ?? 100.sp,
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(100.sp)),
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(100.sp),
//                   child: image.hasValue
//                       ? Flash(
//                           key: Key(image.valueOrNull!.path),
//                           child: Image.file(
//                             image.valueOrNull!,
//                             fit: BoxFit.cover,
//                           ),
//                         )
//                       : PhotoWithUrl(
//                           h: h,
//                           w: w,
//                           // url: (_prefs.user.avatar
//                           //     //+'?v=${DateTime.now().millisecondsSinceEpoch}'
//                           //
//                           //     )
//                         ))),
//         );
//       },
//     );
//   }
// }
