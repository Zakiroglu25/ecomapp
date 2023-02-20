import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:uikit/infrastructure/model/response/map_medicine.dart';

import '../../../infrastructure/cubit/product_details_details/product_details_state.dart';
import '../../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/paddings.dart';
import '../../../utils/constants/physics.dart';
import '../../../widgets/custom/focusable_app_loading.dart';
import '../../../widgets/custom/listview_separated.dart';
import '../../../widgets/general/app_loading.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import '../../../widgets/main/product_item/product_item.dart';
import 'widget/map_details_header.dart';
import 'widget/sliver_handler.dart';
import 'widget/sliver_loading.dart';

class MapDetailsPage extends StatelessWidget {
  final MapMedicine? maps;

  const MapDetailsPage(this.maps, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductOptionDetailsCubit>(context);
    return Cupperfold(
      barColor: MyColors.green235,
      backColor: MyColors.green235,
      showAppbarLittleText: true,
      user: false,
      notification: false,
      slivers: [
        MapDetailsHeaders(maps: maps!),
        const SliverHandler(),
        BlocBuilder<ProductOptionDetailsCubit, ProductOptionDetailsState>(
          builder: (context, state) {
            if (state is ProductODetailsMapListSuccess) {
              final productList = state.productList;
              return SliverToBoxAdapter(
                child: Container(
                  // padding: Paddings.paddingH16,
                  //margin: Paddings.paddingB24,
                  color: MyColors.white,
                  child: StreamBuilder<bool>(
                      stream: cubit.haveElseStream,
                      builder: (context, snapshot) {
                        return ListViewSeparated(
                            padding: Paddings.paddingA16 + Paddings.paddingB60,
                            physics: Physics.never,
                            itemCount: snapshot.data ?? false
                                ? productList!.length + 1
                                : productList!.length,
                            shrinkWrap: true,
                            addAutomaticKeepAlives: true,
                            itemBuilder: (context, index) {
                              return index == productList.length
                                  ? FocusableAppLoading(
                                      onFocus: () =>
                                          cubit.loadMore(maps!.guid!))
                                  : ProductItem(
                                      product: productList[index],
                                      inFav: false);
                            });
                      }),
                ),
              );
            } else {
              return const SliverLoading();
            }
          },
        ),
      ],
    );
  }
}
