import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/pharmacy_page/widget/sliver_loading.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/paddings.dart';
import 'package:uikit/utils/extensions/context.dart';
import 'package:uikit/widgets/doctoro_appbar/doctoro_appbar.dart';
import 'package:uikit/widgets/general/app_loading.dart';

import '../../../infrastructure/cubit/product_details_details/product_details_state.dart';
import '../../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../../infrastructure/model/response/map_medicine.dart';
import '../../../utils/constants/border_radius.dart';
import '../../../widgets/custom/focusable_app_loading.dart';
import '../../../widgets/main/cupperfold/cupperfold.dart';
import '../../../widgets/main/product_item/product_item.dart';
import 'widget/map_details_header.dart';

class PharmacyPage extends StatelessWidget {
  const PharmacyPage({Key? key, this.maps}) : super(key: key);
  final MapMedicine? maps;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductOptionDetailsCubit>(context);
    final double height = 300;
    return Cupperfold(
      user: false,
      notification: false,
      barColor: MyColors.secondary,
      backColor: MyColors.secondary,
      title: '${maps?.name}',
      child: SizedBox(
        height: context.sH,
        child: Stack(
          children: [
            MapDetailsHeaders(
              maps: maps!,
              height: height,
            ),
            // const SliverHandler(),
            DraggableScrollableSheet(
              expand: true,
              initialChildSize: 1 - height / context.sH,
              minChildSize: 1 - height / context.sH,
              maxChildSize: 0.99,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ClipRRect(
                  borderRadius: Radiuses.r36,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: Radiuses.r36,
                    ),
                    child: BlocBuilder<ProductOptionDetailsCubit,
                        ProductOptionDetailsState>(
                      builder: (context, state) {
                        if (state is ProductODetailsMapListSuccess) {
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            controller: scrollController,
                            padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16) +
                                Paddings.paddingB20,
                            itemCount: state is ProductODetailsMapListSuccess
                                ? (state.productList?.length ?? 0) + 1
                                : 0,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                            itemBuilder: (context, index) {
                              if (index == state.productList?.length) {
                                return FocusableAppLoading(onFocus: () {
                                  cubit.loadMore(maps!.guid!);
                                });
                              } else {
                                final product = state.productList![index];
                                return ProductItem(
                                    product: product, inFav: false);
                              }
                            },
                          );
                        } else if (state is ProductODetailsInProgress) {
                          return AppLoading();
                        }
                        return const SliverLoading();
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
