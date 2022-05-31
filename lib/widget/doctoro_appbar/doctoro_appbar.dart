// // Flutter imports:
//
// import 'package:flutter/material.dart';
//
// // Package imports:
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:focus_detector/focus_detector.dart';
//
// import '../../util/constants/app_text_styles.dart';
// import '../../util/constants/colors.dart';
//
// class DoctoroAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final bool? notification;
//   final bool? exitButton;
//   final bool? favButton;
//   final bool? basket;
//   final bool? filterButton;
//   final bool? back;
//   final BuildContext? contextA;
//   final bool? actions;
//   final Function? onTapActions;
//   final bool? centerTitle;
//   final Color? color;
//   final Function? onBack;
//   final bool? deleteButton;
//   final bool? submitButton;
//
//   DoctoroAppBar(
//       {required this.title,
//       // @required this.user,
//       this.notification,
//       this.exitButton,
//       this.actions,
//       this.color,
//       this.back = true,
//       this.onBack,
//       this.onTapActions,
//       required this.contextA,
//       this.centerTitle,
//       this.favButton,
//       this.basket,
//       this.filterButton,
//       this.deleteButton,
//       this.submitButton});
//
//   @override
//   Widget build(BuildContext context) {
//     return FocusDetector(
//       onFocusGained: () {
//         if (notification ?? true) {
//           //  context.read<HeaderCubit>()..fetch();
//         }
//       },
//       child: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: color ?? Colors.white,
//         foregroundColor: color,
//         elevation: 0,
//         titleSpacing: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             (user ?? true)
//                 ? UserButton()
//                 : WidgetOrEmpty(
//                     value: back,
//                     child: BackIOS(
//                       onBack: onBack,
//                     ),
//                   ),
//             Center(
//               child: Text(
//                 title!,
//                 overflow: TextOverflow.ellipsis,
//                 style: AppTextStyles.sfPro600
//                     .copyWith(fontSize: 17.sp, color: MyColors.black0),
//               ),
//             ),
//             rightButtonsRow(context),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Row rightButtonsRow(BuildContext contextZ) {
//     return Row(
//       children: [
//         (notification ?? true)
//             ? NotificationWidget()
//             : (onTapActions == null ? MySizedBox.w40 : Container()),
//         MySizedBox.w8,
//         ActionsButton(
//           onTap: onTapActions,
//         ),
//       ],
//     );
//   }
//
//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => const Size.fromHeight(56);
// }
