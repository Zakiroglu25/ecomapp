import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/border_radius.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/screen/ink_wrapper.dart';

class DeleteItem extends StatelessWidget {
  const DeleteItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      // onTap: () => context
      //     .read<AddressCubit>()
      //     .delete(address.guid!, loading: false, context: context),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: Radiuses.r12, color: MyColors.darkRED),
        width: 55,
        height: 48,
        child: Center(
          child: SvgPicture.asset(
            Assets.svgTrash,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
