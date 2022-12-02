import 'package:flutter/material.dart';
import 'package:uikit/utils/constants/app_text_styles.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/dividers.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';
import 'package:uikit/widgets/custom/custom_radio.dart';

import '../../../../utils/constants/colors.dart';

class SavableDeliveryAddressItem extends StatefulWidget {
  const SavableDeliveryAddressItem(
      {Key? key,
      required this.title,
      this.image = Assets.pngHomeAddress,
      this.subTitleColor = MyColors.grey158,
      this.titleColor = MyColors.black,
      this.selected = false,
      required this.subTitle})
      : super(key: key);

  final String? title, subTitle;
  final String image;
  final bool selected;
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
      onTap: () {
        selected = !selected;
        setState(() {});
      },
      child: Column(
        children: [
          Container(
            color: MyColors.white,
            height: 80,
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
                  CustomRadio(
                    active: selected,
                  ),
                ],
              ),
            ),
          ),
          Dividers.h1grey
        ],
      ),
    );
  }
}
