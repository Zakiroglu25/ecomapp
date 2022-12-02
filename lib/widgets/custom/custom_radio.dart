import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/durations.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';

import '../../utils/constants/assets.dart';

class CustomRadio extends StatefulWidget {
  const CustomRadio({Key? key, required this.active}) : super(key: key);
  final bool active;

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  bool active = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startLogic();
  }

  @override
  void didUpdateWidget(covariant CustomRadio oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    startLogic();
  }

  void startLogic() {
    active = widget.active;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () {
        active = !active;
        setState(() {});
      },
      child: AnimatedCrossFade(
        firstChild: SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              Assets.svgTickCircle,
            )),
        secondChild: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: MyColors.grey235)),
        ),
        crossFadeState:
            active ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Durations.ms100,
      ),
    );
  }
}
