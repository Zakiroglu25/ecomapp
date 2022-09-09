import 'package:doctoro/utils/delegate/random.dart';
import 'package:doctoro/widgets/main/cupperfold/cupperfold.dart';
import 'package:flutter/material.dart';

class BaxtiyarPage extends StatelessWidget {
  const BaxtiyarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Cupperfold(
      child: Container(
        color: Rndm.color,
      ),
      title: "Baxtiyar",
    );
  }
}
