import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/delegate/index.dart';

import '../../../infrastructure/services/hive_service.dart';
import '../../../locator.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/delegate/navigate_utils.dart';
import '../../../utils/delegate/pager.dart';
import '../../../utils/screen/ink_wrapper.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import 'widget/add_insurance.dart';
import 'widget/indicator_widget.dart';
import 'widget/user_data_item_widget.dart';
import 'widget/user_log_out_button.dart';
import 'widget/user_view.dart';

class PageViewExample extends StatefulWidget {
  const PageViewExample({Key? key}) : super(key: key);

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  int _currentIndex = 0;
  double currentPageValue = 1;

  final _pageViewController =
      PageController(initialPage: 0, viewportFraction: 0.75);

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPageValue = (_pageViewController.page! + 1);
      });
    });
  }

  get cards => [
        UserView(),
        EditContact(),
        AddInsurance(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DoctorAppbar(
        title: 'Doctoro profili',
        user: false,
        notification: false,
        color: MyColors.red250,
      ),
      backgroundColor: MyColors.red250,
      body: ValueListenableBuilder(
        builder: (context, Box box, _) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: _pageViewController,
                    itemCount: cards.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final images = cards[index];
                      return images;
                    }),
              ),
              Column(
                children: [
                  Indicator(curr: currentPageValue.round()),
                  MySizedBox.h32,
                  UserLogOutButton(),
                  MySizedBox.h32,
                ],
              )
            ],
          );
        },
        valueListenable: Hive.box('main').listenable(),
      ),
    );
  }
}

class EditContact extends StatelessWidget {
  const EditContact({Key? key}) : super(key: key);

  HiveService get _prefs => locator<HiveService>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: MyColors.white),
          width: 311,
          height: 425.h,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kontaktlar",
                      style: AppTextStyles.sfPro600s16,
                    ),
                    InkWrapper(
                        onTap: () {
                          Go.to(context, Pager.changeNumber);
                        },
                        child: SvgPicture.asset(Assets.svgEditUser))
                  ],
                ),
                MySizedBox.h16,
                UserDataWidgetItem(
                  title: MyText.mail,
                  content: _prefs.user.email,
                ),
                UserDataWidgetItem(
                  title: MyText.num,
                  content: _prefs.user.phone,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
