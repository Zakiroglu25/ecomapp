import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/model/response/product_option_model.dart';
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
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/sized_box.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/general/app_loading.dart';

class ProductOptionDetails extends StatefulWidget {
  SimpleProduct? product;

  ProductOptionDetails({this.product});

  @override
  _ProductOptionDetailsState createState() => _ProductOptionDetailsState();
}

class _ProductOptionDetailsState extends State<ProductOptionDetails> {
  PageController controller = PageController();
  int currentIndex = 0;
  List<String> offerImage = [
    Assets.demo1,
    Assets.demo1,
    Assets.demo1,
  ];

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool switchValue = true;
    return Scaffold(
      appBar: DoctorAppbar(title: "", user: false, contextA: context),
      body: BlocBuilder<ProductOptionDetailsCubit, ProductOptionDetailsState>(
        builder: (context, state) {
          if (state is ProductODetailsSuccess) {
            ProductDetails? product = state.productDetails;
            return ListView(
              children: [
                ProductImgSlider(
                  imgList: [
                    'https://5.imimg.com/data5/ZV/ZQ/EZ/SELLER-43657152/domperidone-parcetamol-tablets-500x500.jpg',
                    'https://5.imimg.com/data5/SELLER/Default/2022/6/PQ/MO/DT/2068994/domperidone-and-paracetamol-tablet-500x500.jpg',
                    'https://5.imimg.com/data5/CR/VG/DA/SELLER-3251912/paracetamol-and-domperidone-tablets-500x500.jpg'
                  ],
                ),
                // ImagePageViewList(
                //     controller: controller,
                //     offerImage: offerImage,
                //     currentIndex: currentIndex),
                // InfoRowWidget(product: product),
                // DetailsTitleWidget(product: product),
                //ShowInsuranceSwitch(switchValue: switchValue),
                // Text("${product?.stockItems?.first.price}"),
                ListView(
                  shrinkWrap: true,
                  physics: Physics.never,
                  padding: Paddings.paddingH16 + Paddings.paddingV12,
                  children: [
                    ManatPrice(
                      price: "${product?.stockItems?.first.price}",
                      textSize: 25,
                      manatSize: 25,
                    ),
                    MySizedBox.h16,
                    Text(
                      'Swiss Energy Herbs Hot Balm Forte isidici balzam  75 ml Forte',
                      style: AppTextStyles.sfPro600s17,
                    ),
                    MySizedBox.h16,
                    ProductDetailProperty(
                      title: 'İstehsal olduğu ölkə',
                      value: '${product?.manufacturedIn}',
                    ),
                    ProductDetailProperty(
                      title: 'Resept',
                      value: (product?.prescriptionRequired ?? false)
                          ? MyText.required
                          : MyText.notRequired,
                    ),
                    ProductDetailProperty(
                      title: 'Məhsulun kodu',
                      value: '${product?.publicId}',
                    ),
                    ProductDetailProperty(
                      title: 'İstehsalçı',
                      value: '${product?.manufacturer?.name}',
                    ),
                    ProductDetailProperty(
                      title: 'Əczaçılıq forması',
                      value: '${product?.pharmaceuticalForm}',
                    ),
                    ProductDetailProperty(
                      title: 'Təsvir',
                      value: '${product?.description}',
                    ),
                    MySizedBox.h16,
                    AppButton(
                      text: MyText.addToCart,
                    )
                  ],
                ),

                // ProductManfactureInfo(product: product)
              ],
            );
          } else if (state is ProductODetailsInProgress) {
            return AppLoading.big();
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
                style: AppTextStyles.sfPro600s17
                    .copyWith(fontSize: 17, color: MyColors.black34),
              ),
              Text("Zeytun aptek",
                  style: AppTextStyles.sfPro600s17
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
                      AppTextStyles.sfPro600s17.copyWith(color: MyColors.white),
                ),
              ],
            ),
            color: MyColors.green,
          )
        ],
      ),
    );
  }
}
