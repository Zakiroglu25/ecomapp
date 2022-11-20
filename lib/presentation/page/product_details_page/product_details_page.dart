import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infrastructure/cubit/product_details_details/product_details_state.dart';
import '../../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../../infrastructure/model/response/product_option_details_model.dart';
import '../../../utils/constants/app_text_styles.dart';
import '../../../utils/constants/assets.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sized_box.dart';
import '../../../widgets/custom/app_button.dart';
import '../../../widgets/general/app_loading.dart';
import 'widget/details_title_text.dart';
import 'widget/header_info_text.dart';
import 'widget/header_price_text.dart';
import 'widget/image_page_view_list.dart';
import 'widget/product_manufacturer_info.dart';
import 'widget/show_insurance_page.dart';

class ProductOptionDetails extends StatefulWidget {
  String? guid;

  ProductOptionDetails({this.guid});

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColors.white,
        iconTheme: IconThemeData(color: MyColors.black),
      ),
      body: BlocBuilder<ProductOptionDetailsCubit, ProductOptionDetailsState>(
        builder: (context, state) {
          if (state is ProductODetailsSuccess) {
            ProductOptionDetailsModel? product = state.product_o_d_model;
            return ListView(
              children: [
                ImagePageViewList(
                    controller: controller,
                    offerImage: offerImage,
                    currentIndex: currentIndex),
                InfoRowWidget(product: product),
                DetailsTitleWidget(product: product),
                ShowInsuranceSwitch(switchValue: switchValue),
                MySizedBox.h16,
                PriceTitleWidget(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: MyColors.grey245,
                    ),
                    child: Column(
                      children: [
                        aptek_tile(),
                        aptek_tile(),
                      ],
                    ),
                  ),
                ),
                ProductManfactureInfo(product: product)
              ],
            );
          } else if (state is ProductODetailsInProgress) {
            return AppLoading();
          }
          return Center(
            child: Text(""),
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
