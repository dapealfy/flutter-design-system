import 'dart:async';

import 'package:flutter/animation.dart';

class Debouncer {
  Duration duration;
  Timer? _timer;

  Debouncer({required this.duration});

  /// Runs the action after the duration has passed since the last call
  /// Don't forget to cancel when the widget is disposed!
  void run(VoidCallback action) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(duration, action);
  }

  void cancel() {
    _timer?.cancel();
  }
}
