import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nil/nil.dart';
import 'package:uikit/infrastructure/model/response/product_option_model.dart';
import 'package:uikit/utils/constants/text.dart';
import 'package:uikit/widgets/custom/listview_separated.dart';
import 'package:uikit/widgets/doctoro_appbar/doctoro_appbar.dart';
import 'package:uikit/widgets/general/app_loading.dart';
import 'package:uikit/widgets/general/empty_widget.dart';
import 'package:uikit/widgets/general/list_or_empty.dart';
import 'package:uikit/widgets/main/product_item/new_product_item.dart';

import '../../../infrastructure/cubit/favorite_cubit/favorite_cubit.dart';
import '../../../infrastructure/cubit/favorite_cubit/favorite_state.dart';
import '../../../utils/constants/paddings.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        user: true,
        notification: true,
        contextA: context,
        title: MyText.favorite,
        filter: false,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteSuccess) {
            //final products = state.favResult.products;
            //final products = context.watch<FavoriteCubit>().products;
            return StreamBuilder<List<SimpleProduct>>(
                stream: context.read<FavoriteCubit>().productsStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return nil;
                  return ListOrEmpty(
                    list: snapshot.data,
                    child: ListViewSeparated(
                      padding: Paddings.paddingA16 + Paddings.paddingB60,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final currentProduct = snapshot.data![index];
                        return NewProductItem(product: currentProduct);
                        // return Text(state.product_option_model[index].product!.title!);
                      },
                    ),
                  );
                });
          } else if (state is FavoriteInProgress) {
            return AppLoading.big();
          } else {
            return EmptyWidget();
          }
        },
      ),
    );
  }
}
