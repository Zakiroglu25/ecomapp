import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/medicines_page/widgets/med_search_field.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/general/empty_widget.dart';
import 'package:uikit/widgets/general/list_or_empty.dart';
import 'package:uikit/widgets/main/product_item/product_item.dart';

import '../../../../infrastructure/cubit/product_option_cubit/product_option_cubit.dart';
import '../../../../infrastructure/cubit/product_option_cubit/product_option_state.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/text.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 10),
          child: Text(
            "Doctoro",
            style: AppTextStyles.sfPro700.copyWith(fontSize: 30),
          ),
        ),
        const MedSearchField(),
        BlocBuilder<ProductOptionCubit, ProductOptionState>(
          builder: (context, state) {
            bbbb("steee: $state");
            if (state is ProductOptionSuccess) {
              final productList = state.productList;
              //final productList = [];
              return Expanded(
                child: ListOrEmpty(
                  list: productList,
                  image: Assets.pngMed,
                  text: MyText.medicines,
                  description: MyText.mediciniesDesc,
                  child: StreamBuilder<bool>(
                      stream: BlocProvider.of<ProductOptionCubit>(context)
                          .haveElseStream,
                      builder: (context, snapshot) {
                        return ListViewSeparated(
                          padding: Paddings.paddingA16 + Paddings.paddingB60,
                          controller: scrollController,
                          itemCount: snapshot.data ?? false
                              ? productList.length + 1
                              : productList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return index == productList.length
                                ? AppLoading.main()
                                : ProductItem(
                                    product: productList[index],
                                    inFav: false,
                                  );
                            // Timer(Durations.s1, () {
                            //   scrollController.jumpTo(
                            //       scrollController.position.maxScrollExtent);
                            // });
                          },
                        );
                      }),
                ),
              );
            } else if (state is ProductOptionInProgress) {
              return Center(child: AppLoading.main());
            }
            else {
              return Expanded(child: EmptyWidget.error());
            }
          },
        ),
        //  Spacer(),
      ],
    );
  }
}
