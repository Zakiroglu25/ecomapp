import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uikit/presentation/page/medicines_page/widgets/med_search_field.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/general/empty_widget.dart';
import 'package:uikit/widgets/general/list_or_empty.dart';
import 'package:uikit/widgets/main/product_item/new_product_item.dart';
import '../../../../infrastructure/cubit/product_option_cubit/product_option_cubit.dart';
import '../../../../infrastructure/cubit/product_option_cubit/product_option_state.dart';
import '../../../../infrastructure/model/response/product_option_model.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/general/app_field.dart';
import '../../../../widgets/general/app_loading.dart';

class MedicinesBody extends StatelessWidget {
  MedicinesBody({Key? key}) : super(key: key);

  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 10) {
          BlocProvider.of<ProductOptionCubit>(context).loadMore();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);
    BlocProvider.of<ProductOptionCubit>(context).loadMore();

    return Column(
      children: [
        const MedSearchField(),
        BlocBuilder<ProductOptionCubit, ProductOptionState>(
          builder: (context, state) {
            if (state is ProductOptionSuccess) {
              final productList = state.productList;
              //final productList = [];
              return Expanded(
                child: ListOrEmpty(
                  list: productList,
                  image: Assets.pngMed,
                  text: MyText.medicines,
                  description: MyText.mediciniesDesc,
                  child: ListViewSeparated(
                    padding: Paddings.paddingA16 + Paddings.paddingB60,
                    controller: scrollController,
                    itemCount: productList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (index < productList.length) {
                        return NewProductItem(
                          product: productList[index],
                          inFav: false,
                        );
                      } else {
                        Timer(Duration(milliseconds: 1), () {
                          scrollController.jumpTo(
                              scrollController.position.maxScrollExtent);
                        });

                        return Center(child: AppLoading.main());
                      }
                    },
                    // itemBuilder: (context, index) => NewProductItem(
                    //   product: productList[index],
                    //   inFav: false,
                    // ),
                  ),
                ),
              );
            } else if (state is ProductOptionInProgress) {
              return Center(child: AppLoading.main());
            } else {
              return Expanded(
                child: EmptyWidget.error(),
              );
            }
          },
        ),
        //  Spacer(),
      ],
    );
  }
}
