import 'package:flutter/material.dart';

import '../../../widgets/doctoro_appbar/doctoro_appbar.dart';
import 'widgets/medicines_body.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: DoctorAppbar(
        addressDropdown: true,
        contextA: context,
        title: '',
        user: true,
        notification: true,
        filter: false,
      ),
      body: MedicinesBody(),
    );
  }
}
