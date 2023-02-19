import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uikit/utils/constants/assets.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/general/app_field.dart';

import '../../../../infrastructure/cubit/products_cubit/index.dart';

class MedSearchField extends StatelessWidget {
  const MedSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();
    return Padding(
      padding: Paddings.paddingH16,
      child: AppField(
        focusNode: cubit.searchFocus,
        hint: MyText.nameOrProducedCountry,
        suffixIcon: SvgPicture.asset(Assets.svgSearch),
        textInputAction: TextInputAction.search,
        controller: cubit.medSearchController,
        onFieldSubmitted: (v) {
          cubit.fetchProduct(title: v);
        },
        radius: 36,
      ),
    );
  }
}
