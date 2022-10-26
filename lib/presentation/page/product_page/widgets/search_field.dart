import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/general/doctoro_field.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppField(
      hint: MyText.searchHint,
      suffixIcon: SvgPicture.asset(Assets.svgSearch),
    );
  }
}
