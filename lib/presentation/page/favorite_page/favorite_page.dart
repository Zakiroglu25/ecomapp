import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/utils/constants/text.dart';
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
      body:

          // Container(
          //   height: 60,
          //   color: Colors.white,
          //   padding: EdgeInsets.only(left: 10, bottom: 20, right: 10),
          //   child: TabBar(
          //     controller: _controller,
          //     isScrollable: true,
          //     indicatorWeight: 0.01,
          //     unselectedLabelColor:
          //     Theme
          //         .of(context)
          //         .textTheme
          //         .headline1!
          //         .color,
          //     labelColor: MyColors.darkRED,
          //     onTap: (index) => setState(() => _selectedIndex = index),
          //     tabs: List<Widget>.generate(
          //       _controller!.length,
          //           (index) =>
          //           Tab(
          //             child: Container(
          //               alignment: Alignment.center,
          //               decoration: BoxDecoration(
          //                 color: index == _selectedIndex
          //                     ? MyColors.red250
          //                     : MyColors.grey245,
          //                 borderRadius: BorderRadius.circular(20),
          //               ),
          //               child: Padding(
          //                 padding: const EdgeInsets.all(12.0),
          //                 child: Row(
          //                   children: [
          //                     index == 0
          //                         ? SvgPicture.asset(
          //                       Assets.svgFav,
          //                       color: _selectedIndex == 0
          //                           ? MyColors.darkRED
          //                           : MyColors.grey158,
          //                     )
          //                         : SvgPicture.asset(
          //                       Assets.docu,
          //                       color: _selectedIndex == 1
          //                           ? MyColors.darkRED
          //                           : MyColors.grey158,
          //                     ),
          //                     MySizedBox.w10,
          //                     index == 0
          //                         ? Text(MyText.favorite)
          //                         : Text("Ödəniş şablonlar")
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //     ),
          //   ),
          // ),
          BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteSuccess) {
            final products = state.favResult.products;
            return ListOrEmpty(
              list: products,
              child: ListView.builder(
                padding: Paddings.paddingA16 + Paddings.paddingB60,
                itemCount: products?.length,
                itemBuilder: (context, index) {
                  final currentProduct = products![index];
                  return NewProductItem(product: currentProduct);
                  // return Text(state.product_option_model[index].product!.title!);
                },
              ),
            );
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
