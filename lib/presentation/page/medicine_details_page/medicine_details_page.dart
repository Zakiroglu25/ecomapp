import 'package:uikit/infrastructure/cubit/product_option_cubit/product_option_cubit.dart';
import 'package:uikit/presentation/page/favorite_page/widget/product_item.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/constants/sized_box.dart';
import 'package:uikit/widgets/custom/app_button.dart';
import 'package:uikit/widgets/doctoro_appbar/doctoro_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uikit/infrastructure/cubit/product_option_cubit/product_option_cubit.dart';

import '../../../infrastructure/cubit/product_option_cubit/product_option_state.dart';
import '../../../infrastructure/model/response/product_option_model.dart';
import '../../../utils/constants/assets.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import '../../../widgets/general/app_field.dart';
import '../../../widgets/general/app_loading.dart';

class MedicineDetailsPage extends StatelessWidget {
  const MedicineDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: "Dermanlar",
        contextA: context,
        user: false,
        addressDropdown: false,
        notification: true,
        filter: true,
      ),
      body: BlocBuilder<ProductOptionCubit, ProductOptionState>(
        builder: (context, state) {
          if (state is ProductOptionSuccess) {
            final model = state.product_option_model;
            print(model);
            return ListView.builder(
                itemCount: model.length,
                itemBuilder: (context, index) {
                  return ProductItem(products: model[index]);
                });
          } else if (state is ProductOptionError) {
            return Center(child: Text("Error"));
          } else if (state is ProductOptionInProgress) {
            return Center(child: AppLoading());
          }
          return Center(child: Text("Alinmadi"));
        },
      ),
    );
  }
}
