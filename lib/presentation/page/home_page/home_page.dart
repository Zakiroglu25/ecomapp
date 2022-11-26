import 'package:flutter/material.dart';
import 'package:uikit/widgets/doctoro_appbar/doctoro_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: "Home",
        contextA: context,
        user: false,
        back: false,
      ),
    );
  }
}
