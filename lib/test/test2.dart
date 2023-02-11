import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/test/test_for_cubit.dart';
import 'package:uikit/utils/constants/colors.dart';
import 'package:uikit/utils/delegate/index.dart';
import 'package:uikit/utils/delegate/my_printer.dart';

import '../utils/constants/boxx.dart';
import '../utils/screen/ink_wrapper.dart';
import '../widgets/general/app_loading.dart';

final bloc2 = TestForCubit();

class TestForPage extends StatelessWidget {
  TestForPage({Key? key}) : super(key: key);

  final bloc1 = TestForCubit();

  final bloc3 = TestForCubit();

  @override
  Widget build(BuildContext context) {
    bbbb("builded");
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: MyColors.white,
          child: Center(child: Builder(builder: (context) {
            bbbb("build c");
            return Builder(builder: (context) {
              bbbb("build d");
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<TestForCubit, TestForState>(
                    bloc: bloc1,
                    builder: (context, state) {
                      bbbb("build bloc1:  {bloc1.hashCode}");
                      if (state is TestForLoading) {
                        return const AppLoading();
                      }
                      return InkWell(
                        child: Container(
                          width: 190,
                          height: 190,
                          child: BlocBuilder<TestForCubit, TestForState>(
                            //    bloc: bloc2,
                            builder: (context, state) {
                              bbbb("build bloc2 : {bloc2.hashCode}");
                              if (state is TestForLoading) {
                                return const AppLoading();
                              }
                              return InkWell(
                                onTap: () =>
                                    context.read<TestForCubit>().test(),
                                //  onTap: () => bloc2.test(),
                                child: Center(
                                  child: Container(
                                    width: 90,
                                    height: 90,
                                    child: const Text("${true}"),
                                    //color: context.watch<TestForCubit>().color,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              );
                            },
                          ),
                          //color: context.watch<TestForCubit>().color,
                          color: Colors.red,
                        ),
                      );
                    },
                  ),
                  Boxx(),
                  BlocBuilder<TestForCubit, TestForState>(
                    bloc: bloc2,
                    builder: (context, state) {
                      bbbb("build bloc2 - bottom: {bloc2.hashCode}");
                      if (state is TestForLoading) {
                        return const AppLoading();
                      }
                      return InkWell(
                        onTap: () =>
                            Go.to(context, Pager.testFor2(context, bloc1)),
                        child: Container(
                          width: 190,
                          height: 190,
                          child: const Text("${true}"),
                          //color: context.watch<TestForCubit>().color,
                          color: Colors.amber,
                        ),
                      );
                    },
                  ),
                ],
              );
            });
          })),
        ),
      ),
    );
  }
}

class TestFor2Page extends StatelessWidget {
  const TestFor2Page({Key? key, required this.bloc}) : super(key: key);
  final dynamic bloc;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: InkWell(
          onTap: () {
            //   context.read<TestForCubit>().test();
            //bloc2.test();
            bloc.test();
            Go.pop(context);
          },
          child: Center(
            child: Container(
              width: 190,
              height: 190,
              child: const Text("${true}"),
              //color: context.watch<TestForCubit>().color,
              color: Colors.amber,
            ),
          ),
        ),
      );
    });
  }
}
