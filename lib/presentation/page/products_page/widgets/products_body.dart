import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/products_page/widgets/med_search_field.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/widgets/general/empty_widget.dart';

import '../../../../infrastructure/cubit/products_cubit/index.dart';
import '../../../../widgets/general/app_loading.dart';
import '../products_doctoro_text.dart';
import 'products_initial_view.dart';
import 'products_list.dart';

class ProductsBody extends StatelessWidget {
  ProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        color: MyColors.transparent,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const ProductsDoctoroText(),
          const MedSearchField(),
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsInitial) {
                  return const ProductsInitialView();
                }
                if (state is ProductsSuccess) {
                  return ProductsList(productList: state.productList);
                } else if (state is ProductsInProgress) {
                  return const Center(child: AppLoading());
                } else {
                  return Expanded(child: EmptyWidget.error());
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
