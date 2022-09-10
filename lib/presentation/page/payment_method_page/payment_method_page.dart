import 'package:doctoro/utils/constants/app_text_styles.dart';
import 'package:doctoro/utils/constants/assets.dart';
import 'package:doctoro/utils/constants/colors.dart';
import 'package:doctoro/utils/constants/sized_box.dart';
import 'package:doctoro/utils/constants/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../test.dart';
import '../../../utils/constants/boxx.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../widgets/custom/doctoro_button.dart';
import '../../../widgets/general/cupertino_modal_body.dart';
import '../../../widgets/general/empty_widget.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import 'widget/add_bank_kart.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Cupperfold(
        onBack: () => Go.pop(context),
        notification: false,
        user: false,
        title: 'Ödəniş üsulları',
        child: Column(
          children: [


            AppButton(
              onTap: () {
                Go.to(context, AddBankCard());
              },
              text: "+ Ödəniş üsulu əlavə et",
            )
          ],
        ),
    );
  }
}

// import 'package:doctoro/widgets/doctoro_appbar/doctoro_appbar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//
// import 'modal_with_scroll.dart';
//
// class CupertinoModalBody extends StatelessWidget {
//   const CupertinoModalBody({Key? key, required this.body}) : super(key: key);
//   final Widget body;
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: (settings) {
//         switch (settings.name) {
//           case '/':
//             return MaterialWithModalsPageRoute(
//                 builder: (_) {
//                   return Material(
//                     child: body,
//                   );
//                 },
//                 settings: settings);
//         }
//         return MaterialPageRoute(builder: (context) {
//           return Scaffold(
//             appBar: DoctorAppbar(
//               user: false,
//               notification: false,
//               title: "Çatdırılma ünvanlarım",
//               contextA: context,
//             ),
//             body: Builder(
//               builder: (context) => CupertinoPageScaffold(
//                 navigationBar: CupertinoNavigationBar(
//                   transitionBetweenRoutes: true,
//                   middle: Text('Normal Navigation Presentation'),
//                   trailing: GestureDetector(
//                     child: Icon(Icons.arrow_upward),
//                     onTap: () {
//                       CupertinoScaffold.showCupertinoModalBottomSheet(
//                         expand: true,
//                         context: context,
//                         backgroundColor: Colors.transparent,
//                         builder: (context) => Stack(
//                           children: <Widget>[
//                             ModalWithScroll(),
//                             Positioned(
//                               height: 40,
//                               left: 40,
//                               right: 40,
//                               bottom: 20,
//                               child: MaterialButton(
//                                 onPressed: () => Navigator.of(context).popUntil(
//                                         (route) => route.settings.name == '/'),
//                                 child: Text('Pop back home'),
//                               ),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 child: Center(child: Container()),
//               ),
//             ),
//           );
//         });
//       },
//     );
//   }
// }
