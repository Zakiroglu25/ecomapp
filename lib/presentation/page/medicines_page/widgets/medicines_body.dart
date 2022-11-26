import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/general/empty_widget.dart';
import 'package:uikit/widgets/main/product_item/new_product_item.dart';
import '../../../../infrastructure/cubit/product_option_cubit/product_option_cubit.dart';
import '../../../../infrastructure/cubit/product_option_cubit/product_option_state.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../widgets/general/app_field.dart';
import '../../../../widgets/general/app_loading.dart';

class MedicinesBody extends StatelessWidget {
  const MedicinesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return BlocProvider(
      create: (context) => ProductOptionCubit()..fetchProduct(),
      child: BlocBuilder<ProductOptionCubit, ProductOptionState>(
        builder: (context, state) {
          if (state is ProductOptionSuccess) {
            final productList = state.productList;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16),
                  child: AppField(),
                ),
                Expanded(
                  child: ListViewSeparated(
                      padding: Paddings.paddingA16 + Paddings.paddingB60,
                      controller: _scrollController,
                      itemCount: productList.length,
                      itemBuilder: (context, index) =>
                          NewProductItem(product: productList[index])),
                ),
              ],
            );
          } else if (state is ProductOptionInProgress) {
            return Center(child: AppLoading.big());
          } else {
            return EmptyWidget();
          }
        },
      ),
    );
  }
}
