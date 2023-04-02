import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/config/configs.dart';
import 'package:uikit/presentation/page/products_page/widgets/med_search_field.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/widgets/custom/focusable_app_loading.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
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

class ProductsBody extends StatelessWidget {
  ProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        color: MyColors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: Paddings.paddingH16 + Paddings.paddingT10,
              child: Text(
                Configs.appName,
                style: AppTextStyles.sfPro700.copyWith(fontSize: 30),
              ),
            ),
            const MedSearchField(),
            BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  final productList = state.productList;
                  //final productList = [];
                  return Expanded(
                    child: ListOrEmpty(
                      list: productList,
                      image: Assets.pngMed,
                      text: MyText.medicines,
                      description: MyText.mediciniesDesc,
                      child: StreamBuilder<bool>(
                          stream: BlocProvider.of<ProductsCubit>(context)
                              .haveElseStream,
                          builder: (context, snapshot) {
                            return ListViewSeparated(
                              padding:
                                  Paddings.paddingH16 + Paddings.paddingB60,
                              itemCount: snapshot.data ?? false
                                  ? productList.length + 1
                                  : productList.length,
                              shrinkWrap: true,
                              addAutomaticKeepAlives: true,
                              itemBuilder: (context, index) {
                                return productList.isEmpty ||
                                        index == productList.length
                                    ? FocusableAppLoading(
                                        onFocus: () => productList.isEmpty
                                            ? null
                                            : context
                                                .read<ProductsCubit>()
                                                .loadMore())
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
                } else if (state is ProductsInProgress) {
                  return Center(child: AppLoading());
                } else {
                  return Expanded(child: EmptyWidget.error());
                }
              },
            ),
            //  Spacer(),
          ],
        ),
      ),
    );
  }
}
