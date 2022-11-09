import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/cubit/category_cubit/category_cubit.dart';
import 'package:uikit/utils/constants/text.dart';

import '../../../infrastructure/cubit/product_option_cubit/product_option_cubit.dart';
import '../../../infrastructure/cubit/product_option_cubit/product_option_state.dart';
import '../../../widgets/custom/app_tab.dart';
import '../../../widgets/general/app_loading.dart';
import '../../../widgets/main/cuppertabs_wp/cupper_tab_wp.dart';
import '../favorite_page/widget/product_item.dart';

class MedicineDetailsPage extends StatelessWidget {
  const MedicineDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(builder: (context, state) {
      if (state is CategorySuccess) {
        final categories = state.category;

        return CupperTabWP(
            title: MyText.medicines,
            back: true,
            user: false,
            notification: false,
            showAppbarLittleText: true,
            isScrollable: true,
            tabPages: categories.map((e) => orders(e.guid!)).toList(),
            tabs: categories
                .map((e) => AppTab(
                      text: e.name!,
                      index: 0,
                    ))
                .toList());
      } else if (state is CategoryInProgress) {
        return Scaffold(
          body: Center(
              child: AppLoading(
            s: 70,
          )),
        );
      }
      return Center(child: Text("Alinmadi"));
    });
  }

  Widget orders(String guid) => BlocProvider(
        create: (context) => ProductOptionCubit()..fetchProduct(),
        child: BlocBuilder<ProductOptionCubit, ProductOptionState>(
          builder: (context, state) {
            if (state is ProductOptionSuccess) {
              final productList = state.productList;
              return ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) =>
                      ProductItem(products: productList[index]));
            } else if (state is ProductOptionError) {
              return Center(child: Text("Error"));
            } else if (state is ProductOptionInProgress) {
              return Center(
                  child: AppLoading(
                s: 120,
              ));
            }
            return Center(child: Text("Alinmadi"));
          },
        ),
      );
}
