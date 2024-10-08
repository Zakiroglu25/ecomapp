import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uikit/utils/constants/durations.dart';
import 'package:uikit/utils/delegate/index.dart';

part 'test_for_state.dart';

class TestForCubit extends Cubit<TestForState> {
  TestForCubit() : super(TestForInitial(5));

  Color color = Colors.red;
  int number = 5;

  void emitState() {
    color = Rndm.color;
    emit(TestForInitial2(number));
  }

  void plus() {
    number += 1;
    color = Rndm.color;
    //emit(TestForInitial3(number));
  }

  void test() async {
    emit(TestForLoading(number));

    await Future.delayed(Durations.s5);
    number += 1;
    color = Rndm.color;
    emit(TestForInitial2(number));
    //emit(TestForInitial3(number));
  }
}
