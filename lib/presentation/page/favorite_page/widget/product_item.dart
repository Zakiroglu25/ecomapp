import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../../../infrastructure/model/response/product_option_model.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/sized_box.dart';
import '../../../../utils/delegate/navigate_utils.dart';
import '../../../../widgets/custom/app_button.dart';
import '../../product_details_page/product_details_page.dart';

class ProductItem extends StatelessWidget {
  final SimpleProduct? products;

  ProductItem({this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: Paddings.paddingH16 + Paddings.paddingV10,
          child: GestureDetector(
            onTap: () {
              Go.to(
                  context,
                  BlocProvider(
                    create: (context) => ProductOptionDetailsCubit()
                      ..fetchProduct(products!.guid!),
                    child: ProductOptionDetails(),
                  ));
            },
            child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MyColors.grey245,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.demo),
                        MySizedBox.w12,
                        if (products != null)
                          SizedBox(
                            width: 199,
                            child: Text(
                              products!.product!.title!,
                              style: AppTextStyles.sfPro400s14,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        if (products != null) Text("Salam"),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              print("Secilmish");
                            },
                            child: SvgPicture.asset(Assets.svgFav)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MySizedBox.w75,
                        Text(
                          products!.minPrice!.toString() + " ₼-dan",
                          style: AppTextStyles.sfPro600s16,
                        ),
                        Spacer(),
                        AppButton(
                          onTap: () {
                            print("Sebete");
                          },
                          borderRadius: 99,
                          w: 109,
                          h: 36,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.svgCart,
                                color: MyColors.white,
                              ),
                              MySizedBox.w4,
                              Text(
                                "Səbətə",
                                style: AppTextStyles.sfPro400s14
                                    .copyWith(color: MyColors.white),
                              ),
                            ],
                          ),
                          color: MyColors.green,
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}
