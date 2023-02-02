import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/product_details_page/widget/product_detail_property.dart';
import 'package:uikit/utils/constants/physics.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/product_image_slider.dart';
import 'package:uikit/widgets/doctoro_appbar/doctoro_appbar.dart';
import 'package:uikit/widgets/general/empty_widget.dart';
import 'package:uikit/widgets/general/manat_price.dart';

import '../../../infrastructure/cubit/product_details_details/product_details_state.dart';
import '../../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../../infrastructure/model/response/product_option_details_model.dart';
import '../../../infrastructure/model/response/search_items.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/sized_box.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/general/app_loading.dart';
import 'widget/product_add_to_cart_button.dart';

class ProductOptionDetails extends StatelessWidget {
  final SimpleProduct? product;

  ProductOptionDetails({Key? key, this.product}) : super(key: key);

  List<String> offerImage = [
    Assets.demo1,
    Assets.demo1,
    Assets.demo1,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: "",
        user: false,
        contextA: context,
        notification: false,
      ),
      body: BlocBuilder<ProductOptionDetailsCubit, ProductOptionDetailsState>(
        builder: (context, state) {
          if (state is ProductODetailsSuccess) {
            ProductDetails? product = state.productDetails;
            return ListView(
              children: [
                ProductImgSlider(
                  imgList: product?.images ?? [],
                ),
                ListView(
                  shrinkWrap: true,
                  physics: Physics.never,
                  padding: Paddings.paddingH16 + Paddings.paddingV12,
                  children: [
                    ManatPrice(
                      price: "${product?.price}",
                      textSize: 25,
                      manatSize: 25,
                    ),
                    MySizedBox.h16,
                    Text(
                      "${product?.title!}",
                      style: AppTextStyles.sfPro600s16,
                    ),
                    MySizedBox.h16,
                    ProductDetailProperty(
                      title: MyText.manufacturedIn,
                      value: '${product?.manufacturedIn}',
                    ),
                    ProductDetailProperty(
                      title: MyText.recipe,
                      value: (product?.prescriptionRequired ?? false)
                          ? MyText.required
                          : MyText.notRequired,
                    ),
                    ProductDetailProperty(
                      title: MyText.productCode,
                      value: '${product?.publicId}',
                    ),
                    ProductDetailProperty(
                      title: MyText.producer,
                      value: '${product?.manufacturer?.name}',
                    ),
                    ProductDetailProperty(
                      title: MyText.pharmaceuticalForm,
                      value: '${product?.pharmaceuticalForm}',
                    ),
                    ProductDetailProperty(
                      title: MyText.description,
                      value: '${product?.description}',
                    ),
                    MySizedBox.h16,
                    ProductAddToCartButton(
                      guid: product?.guid,
                      isInCart: product?.isInCart,
                    )
                  ],
                ),

                // ProductManfactureInfo(product: product)
              ],
            );
          } else if (state is ProductODetailsInProgress) {
            return const AppLoading();
          }
          return EmptyWidget(
            text: MyText.error,
          );
        },
      ),
    );
  }

  Widget aptek_tile() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.asset(Assets.demo2),
          MySizedBox.w12,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "370 ₼ ",
                style: AppTextStyles.sfPro600
                    .copyWith(fontSize: 17, color: MyColors.black34),
              ),
              Text(
                "19 ₼/ay. ",
                style: AppTextStyles.sfPro600s16
                    .copyWith(fontSize: 17, color: MyColors.black34),
              ),
              Text("Zeytun aptek",
                  style: AppTextStyles.sfPro600s16
                      .copyWith(fontSize: 17, color: MyColors.mainRED)),
            ],
          ),
          Spacer(),
          AppButton(
            borderRadius: 99,
            w: 109,
            h: 36,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_rounded,
                  color: MyColors.white,
                ),
                Text(
                  "Sebete",
                  style:
                      AppTextStyles.sfPro600s16.copyWith(color: MyColors.white),
                ),
              ],
            ),
            color: MyColors.green85,
          )
        ],
      ),
    );
  }
}
