import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/dividers.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';
import 'package:uikit/widgets/custom/custom_radio.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/delegate/navigate_utils.dart';

typedef OnAddressChanged = void Function();

class SavableDeliveryAddressItem extends StatefulWidget {
  const SavableDeliveryAddressItem(
      {Key? key,
      required this.title,
      this.onTap,
      this.image = Assets.pngHomeAddress,
      this.subTitleColor = MyColors.grey158,
      this.titleColor = MyColors.black,
      this.selected = false,
      required this.subTitle})
      : super(key: key);

  final String? title, subTitle;
  final String image;
  final bool selected;
  final Function? onTap;
  final Color titleColor, subTitleColor;

  @override
  State<SavableDeliveryAddressItem> createState() =>
      _SavableDeliveryAddressItemState();
}

class _SavableDeliveryAddressItemState
    extends State<SavableDeliveryAddressItem> {
  bool selected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startLogic();
  }

  @override
  void didUpdateWidget(covariant SavableDeliveryAddressItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    startLogic();
  }

  void startLogic() {
    selected = widget.selected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      onTap: () async {
        selected = !selected;
        setState(() {});
        await widget.onTap?.call();
        Go.pop(context);
      },
      child: ListView(
        shrinkWrap: true,
        physics: Physics.never,
        padding: Paddings.paddingV4,
        children: [
          Container(
            color: MyColors.white,
            // height: 80,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 44, width: 44, child: Image.asset(widget.image)),
                  MySizedBox.w16,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.title}",
                          style: AppTextStyles.sfPro600s16
                              .copyWith(color: widget.titleColor),
                        ),
                        Text(
                          '${widget.subTitle}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.sfPro400s14
                              .copyWith(color: widget.subTitleColor),
                        ),
                      ],
                    ),
                  ),
                  MySizedBox.w16,
                  CustomRadio(active: selected),
                ],
              ),
            ),
          ),
          MySizedBox.h4,
          Dividers.h1grey,
        ],
      ),
    );
  }
}
