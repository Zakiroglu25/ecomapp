import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/infrastructure/model/response/map_medicine.dart';

import '../../../infrastructure/cubit/cart/cart_cubit.dart';
import '../../../infrastructure/cubit/favorite_cubit/favorite_cubit.dart';
import '../../../infrastructure/cubit/product_details_details/product_details_state.dart';
import '../../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../../utils/constants/border_radius.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/physics.dart';
import '../../../widgets/custom/listview_separated.dart';
import '../../../widgets/general/app_loading.dart';
import '../../../widgets/general/pagenatible.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import '../../../widgets/main/doctoro_bottom_sheet/widget/handle_line.dart';
import '../../../widgets/main/product_item/product_item.dart';
import 'widget/map_details_header.dart';

class MapDetailsPage extends StatelessWidget {
  final MapMedicine? maps;

  MapDetailsPage(this.maps, {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // setupScrollController(context);
    // BlocProvider.of<ProductOptionDetailsCubit>(context).loadMore(maps!.guid!);
    return Paginatible(
      onBottom: () => BlocProvider.of<ProductOptionDetailsCubit>(context).loadMore(maps!.guid!),
      child: (scrollController) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child:MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FavoriteCubit(),
            ),
            BlocProvider(
              create: (context) => CartCubit(),
            ),
          ],
          child: Cupperfold(
            barColor: MyColors.green235,
            backColor: MyColors.green235,
            showAppbarLittleText: true,
            user: false,
            notification: false,
            slivers: [
              MapDetailsHeaders(
                maps: maps!,
              ),
              SliverFillRemaining(
                child: Container(
                  padding: Paddings.paddingH16,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(child: const HandleLine()),
                        BlocProvider(
                          create: (context) => ProductOptionDetailsCubit()
                            ..fetchProductMapGuid(maps!.guid!),
                          child: BlocBuilder<ProductOptionDetailsCubit,
                              ProductOptionDetailsState>(
                            builder: (context, state) {
                              if (state is ProductODetailsMapListSuccess) {
                                final productList = state.productList;
                                return StreamBuilder<bool>(
                                    stream: BlocProvider.of<ProductOptionDetailsCubit>(context)
                                        .haveElseStream,
                                    builder: (context, snapshot) {
                                    return ListViewSeparated(
                                        padding:
                                        Paddings.paddingA16 + Paddings.paddingB60,
                                        controller: scrollController,
                                        itemCount: snapshot.data ?? false
                                            ? productList!.length + 1
                                            : productList!.length,
                                        shrinkWrap: true,
                                        addAutomaticKeepAlives: true,
                                        itemBuilder: (context, index) {

                                          return index == productList.length
                                              ? AppLoading.main()
                                              : ProductItem(
                                            product: productList[index],
                                            inFav: false,
                                          );

                                        });
                                  }
                                );
                              } else if (state is ProductODetailsError) {
                                return Container();
                              } else {
                                return const AppLoading();
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: Radiuses.rt24,
                    color: MyColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}