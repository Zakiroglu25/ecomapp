import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/presentation/page/map_details_page/widget/sliver_loading.dart';

import '../../../infrastructure/cubit/product_details_details/product_details_state.dart';
import '../../../infrastructure/cubit/product_details_details/product_options_details_cubit.dart';
import '../../../infrastructure/model/response/map_medicine.dart';
import '../../../widgets/custom/focusable_app_loading.dart';
import '../../../widgets/main/product_item/product_item.dart';
import 'widget/map_details_header.dart';
import 'widget/sliver_handler.dart';

class MapDetailsPage extends StatelessWidget {
  const MapDetailsPage({Key? key, this.maps}) : super(key: key);
  final MapMedicine? maps;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductOptionDetailsCubit>(context);
    return Scaffold(
      body: Stack(
        children: [
          MapDetailsHeaders(maps: maps!),
          // const SliverHandler(),
          DraggableScrollableSheet(
            expand: true,
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
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
                            vertical: 16, horizontal: 16),
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
                            return ProductItem(product: product, inFav: false);
                          }
                        },
                      );
                    }
                    return SliverLoading();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
