import 'package:doctoro/widget/doctoro_appbar/doctoro_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DoctorAppbar(
        title: "Home",
        contextA: context,
        user: false,
        back: false
        ,
      ),
    );
  }
}
