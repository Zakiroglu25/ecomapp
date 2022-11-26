import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/test/test_for_cubit.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/delegate/my_printer.dart';

import '../utils/screen/ink_wrapper.dart';

class TestForPage extends StatelessWidget {
  const TestForPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bbbb("builded");
    return Scaffold(
      body: Container(
        color: MyColors.white,
        child: Center(child: Builder(builder: (context) {
          bbbb("build c");
          return InkWrapper(
              onTap: () => context.read<TestForCubit>()..emitState(),
              child: Builder(builder: (context) {
                bbbb("build d");
                return Container(
                  width: 90,
                  height: 90,
                  child: Text("${true}"),
                  color: context.watch<TestForCubit>().color,
                );
              }));
        })),
      ),
    );
  }
}
