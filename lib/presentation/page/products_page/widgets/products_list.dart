import 'package:flutter/material.dart';
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
import '../../../../infrastructure/model/response/search_items.dart';
import '../../../../utils/constants/app_text_styles.dart';
import '../../../../utils/constants/assets.dart';
import '../../../../utils/constants/paddings.dart';
import '../../../../utils/constants/text.dart';
import '../../../../widgets/general/app_loading.dart';
import 'lets_search_medicine_widget.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key,required this.productList}) : super(key: key);
final List<SimpleProduct> productList;
  @override
  Widget build(BuildContext context) {
    return ListOrEmpty(
      list: productList,
      image: Assets.pngMed,
      text: MyText.medicines,
      description: MyText.medicineSubtitle,
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
    );
  }
}
