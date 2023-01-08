import 'package:flutter/material.dart';
import 'package:uikit/widgets/doctoro_appbar/doctoro_appbar.dart';

import '../medicines_page/widgets/product_body.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);
//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        addressDropdown: true,
        contextA: context,
        title: '',
        user: true,
        notification: true,
        filter: false,
        // actions: [
        //   ActionsButton(),
        //   FilterWidget(),
        // ],
      ),
      body: ProductBody(),
    );
  }
}
