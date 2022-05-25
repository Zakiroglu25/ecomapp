import 'package:doctoro/presantation/page/auth/register_page/register_page.dart';
import 'package:doctoro/util/constants/assets.dart';
import 'package:doctoro/util/constants/colors.dart';
import 'package:doctoro/util/constants/sized_box.dart';
import 'package:doctoro/util/constants/text.dart';
import 'package:doctoro/util/delegate/navigate_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../util/constants/size_config.dart';
import '../../../widget/custom/doctoro_button.dart';
import 'widgets/indicator_widget.dart';
import 'widgets/page_one.dart';
import 'widgets/page_three.dart';
import 'widgets/page_two.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

ValueNotifier<int> indexValueNotifier = ValueNotifier(1);

class _OnboardPageState extends State<OnboardPage>
    with TickerProviderStateMixin {
  PageController? pageController;
  double currentPageValue = 1;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController!.addListener(() {
      setState(() {
        currentPageValue = (pageController!.page! + 1);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              onPageChanged: (index) {},
              controller: pageController,
              children: [PageViewOne(), PageViewTwo(), PageViewThree()],
            ),
            Positioned(
              left: 32,
                top: 16,
                child: SvgPicture.asset(Assets.red_logo)),
            Positioned(
              top: 190,
              left: 32,
              child: Container(
                  child: SmoothPageIndicator(
                    controller: pageController!,
                    count: 3,
                    effect: ScrollingDotsEffect(
                      dotHeight: 6,
                      dotWidth: 6,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MySizedBox.h40,
                  DoctoroButton(
                    onTap: (){
                      Go.to(context, Register());
                    },
                    borderRadius: 4,
                    text: MyText.register,
                  ),
                  MySizedBox.h8,
                  DoctoroButton(
                    borderRadius: 4,
                    color: MyColors.btn_passive,
                    text: MyText.login,
                    textColor: MyColors.black0,
                  ),
                  MySizedBox.h8,
                ],
              ),
            ),
            // ButtonSkip(currentPageValue.round()),
          ],
        ),
      ),
    );
  }
}
