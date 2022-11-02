import 'package:uikit/widgets/doctoro_appbar/doctoro_appbar.dart';
import 'package:flutter/material.dart';

import 'widgets/appbar_address_widget.dart';
import 'widgets/product_body.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

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
      ),
      body: ProductBody(),
    );
  }
}
