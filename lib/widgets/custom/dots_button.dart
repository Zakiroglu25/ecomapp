import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/screen/widget_or_empty.dart';

class DotsButton extends StatefulWidget {
  const DotsButton(
      {Key? key,
      required this.controller,
      required this.menuBuilder,
      this.show = true})
      : super(key: key);

  final CustomPopupMenuController controller;
  final bool show;
  final Widget Function() menuBuilder;

  @override
  State<DotsButton> createState() => _DotsButtonState();
}

class _DotsButtonState extends State<DotsButton> {
  late CustomPopupMenuController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CustomPopupMenuController();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetOrEmpty(
      value: widget.show,
      elseChild: Container(),
      child: CustomPopupMenu(
        arrowSize: 15,
        position: PreferredPosition.top,
        arrowColor: MyColors.black,
        barrierColor: MyColors.transparent,
        child: Container(
          width: 40,
          height: 40,
          padding: EdgeInsets.only(right: 16, top: 8),
          color: MyColors.transparent,
          child: Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              Assets.svgDots,
              color: MyColors.grey158,
            ),
          ),
        ),

        menuBuilder: widget.menuBuilder,
        pressType: PressType.singleClick,

        ///mesafe
        verticalMargin: -5,
        controller: _controller,
      ),
    );
  }
}
