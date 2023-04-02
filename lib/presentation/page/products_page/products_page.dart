import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';

import '../../../infrastructure/cubit/products_cubit/index.dart';
import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import 'widgets/products_body.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onVisibilityGained: () =>
          context.read<ProductsCubit>().fetchProduct(loading: false),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: DoctorAppbar(
            addressDropdown: true,
            contextA: context,
            title: '',
            user: true,
            notification: true,
            filter: false,
          ),
          body: ProductsBody(),
        ),
      ),
    );
  }
}
