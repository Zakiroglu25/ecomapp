import 'package:doctoro/utils/constants/border_radius.dart';
import 'package:doctoro/utils/constants/mock.dart';
import 'package:doctoro/utils/constants/paddings.dart';
import 'package:doctoro/widgets/general/colorfull_bordered.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctoro/widgets/custom/column_with_space.dart';
import '../../../../utils/constants/text.dart';
import 'recipe_photo.dart';
import 'recipe_text.dart';
import 'recipe_upload_button.dart';

class RecipeBox extends StatelessWidget {
  const RecipeBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RecipeText(),
        SpacedColumn(
          space: 8,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            UnicornOutlineButton(
              onPressed: () {},
              gradient: LinearGradient(
                  tileMode: TileMode.mirror,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(93, 95, 239, 0.5),
                    Color.fromRGBO(39, 227, 216, 0.5),
                    Color.fromRGBO(227, 46, 46, 0.5),
                    Color.fromRGBO(254, 178, 1, 0.5),
                  ]),
              strokeWidth: 1,
              padding: Paddings.paddingA2,
              radius: 99,
              child: Container(
                padding: Paddings.paddingH12 + Paddings.paddingV8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "...${MockData.medicineImgName.substring(MockData.medicineImgName.length - 14, MockData.medicineImgName.length)} ",
                      overflow: TextOverflow.clip,
                    ),
                    Icon(Icons.cancel_rounded)
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: Radiuses.r99,
                    gradient: LinearGradient(
                        tileMode: TileMode.mirror,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromRGBO(248, 235, 253, 1),
                          Color.fromRGBO(248, 235, 253, 1),
                          Color.fromRGBO(255, 246, 225, 1),
                          Color.fromRGBO(235, 251, 228, 1),
                        ])),
              ),
            ),
            // RecipeUploadButton(),
            RecipePhoto()
          ],
        )
      ],
    );
  }
}
