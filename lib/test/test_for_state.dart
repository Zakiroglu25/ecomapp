part of 'test_for_cubit.dart';

@immutable
abstract class TestForState {
  int number;

  TestForState(this.number);
}

class TestForInitial extends TestForState {
  TestForInitial(super.number);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TestForLoading extends TestForState {
  TestForLoading(super.number);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TestForInitial2 extends TestForState {
  TestForInitial2(super.number);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class TestForInitial3 extends TestForState {
  TestForInitial3(super.number);

  @override
  // TODO: implement props
  List<Object?> get props => [number];
}
