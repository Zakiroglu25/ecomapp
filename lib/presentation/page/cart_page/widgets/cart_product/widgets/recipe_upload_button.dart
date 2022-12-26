import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uikit/infrastructure/cubit/cart/cart_cubit.dart';
import 'package:uikit/utils/constants/border_radius.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/utils/screen/ink_wrapper.dart';

import '../../../../../../utils/constants/sized_box.dart';
import '../../../../../../utils/delegate/navigate_utils.dart';
import '../../../../../../utils/screen/alert.dart';
import '../../../../../../widgets/custom/app_button.dart';

class RecipeUploadButton extends StatelessWidget {
  const RecipeUploadButton({Key? key, required this.guid}) : super(key: key);
  final String? guid;
  @override
  Widget build(BuildContext context) {
    return InkWrapper(
      radius: 99,
      onTap: () => Alert.body(context,
          buttonText: MyText.gallery,
          textAlign: TextAlign.center,
          title: MyText.youMustSelectOneOfThem,
          image: MySizedBox.h16,
          onTap: () => context.read<CartCubit>().checkAndPickImage(context,
              imageSource: ImageSource.gallery, cartGuid: guid),
          secondButton: AppButton(
            onTap: () {
              Go.pop(context);
              context.read<CartCubit>().checkAndPickImage(context,
                  imageSource: ImageSource.camera, cartGuid: guid);
            },
            text: MyText.camera,
          )),
      child: Container(
        //  width: 124,
        height: 36,
        padding: Paddings.paddingH12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text("${MyText.uploadRecipe} "),
            Icon(Icons.add_circle_rounded)
          ],
        ),
        decoration: BoxDecoration(
            color: MyColors.green235,
            border: Border.all(color: MyColors.mainGreen85),
            borderRadius: Radiuses.r99),
      ),
    );
  }
}
