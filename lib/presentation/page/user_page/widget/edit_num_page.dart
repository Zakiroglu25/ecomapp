// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:uikit/widgets/doctoro_appbar/doctoro_appbar.dart';
//
// import '../../../../infrastructure/services/hive_service.dart';
// import '../../../../locator.dart';
// import '../../../../utils/constants/assets.dart';
// import '../../../../utils/delegate/navigate_utils.dart';
// import '../../change_number/change_number_page.dart';
// import '../../settings_page/widget/edit_field_widget.dart';
//
// class EditPhonePage extends StatelessWidget {
//   const EditPhonePage({Key? key}) : super(key: key);
//
//   HiveService get _prefs => locator<HiveService>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: DoctorAppbar(
//         title: 'Edit',
//         user: false,
//         contextA: context,
//         notification: false,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             EditFieldWidget(
//               onTap: () {
//                 Go.to(context, ChangeNumberPage());
//               },
//               headText: "Nömrəniz",
//               subTitle: "Mövcud nömrəniz",
//               title: _prefs.user.phone,
//               png: false,
//               switchW: false,
//               sufixImageUrl: Assets.svgCallDark,
//               // prefixImageUrl: SvgPicture.asset(Assets.svgEdit),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
