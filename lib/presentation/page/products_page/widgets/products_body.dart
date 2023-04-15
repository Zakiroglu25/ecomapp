import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/config/configs.dart';
import 'package:uikit/presentation/page/products_page/widgets/med_search_field.dart';
import 'package:uikit/presentation/page/products_page/widgets/pasha_card.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/widgets/custom/column_with_space.dart';
import 'package:uikit/widgets/custom/focusable_app_loading.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/general/app_element_box.dart';
import 'package:uikit/widgets/general/empty_widget.dart';
import 'package:uikit/widgets/general/list_or_empty.dart';
import 'package:uikit/widgets/general/pagenatible.dart';
import 'package:uikit/widgets/main/product_item/product_item.dart';

import '../../../../infrastructure/cubit/products_cubit/index.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/general/app_loading.dart';
import '../products_doctoro_text.dart';
import 'lets_search_medicine_widget.dart';
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
