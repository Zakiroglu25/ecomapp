import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../../utils/constants/text.dart';

mixin CountDownMixin {
  static const initialTime = 59;
  late Timer timer;

  ///////countdownTime
  final BehaviorSubject<int> countdownTime =
      BehaviorSubject<int>.seeded(initialTime);

  Stream<int> get countdownTimeStream => countdownTime.stream;

  updateCountdownTime(int? value) {
    if (value == null) {
      countdownTime.value = 0;
      countdownTime.sink.addError(MyText.field_is_not_correct);
    } else {
      countdownTime.sink.add(value);
    }
  }

  decreaseCountdownTime() {
    countdownTime.sink.add(--countdownTime.value);
  }

  //timer
  void startCountdownTimer() {
    updateCountdownTime(initialTime);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdownTime.value > 0) {
        decreaseCountdownTime();
      } else {
        timer.cancel();
        //decreaseCountdownTime();
      }
    });
  }

  void restartCountdown() {
    updateCountdownTime(initialTime);
    // _showButton = false;
    startCountdownTimer();
  }
}
