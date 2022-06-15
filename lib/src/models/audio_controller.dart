import 'package:flutter/cupertino.dart';

class AudioController extends ChangeNotifier {
  bool _playing = false;
  Duration _duration = const Duration(microseconds: 0);
  Duration _current = const Duration(microseconds: 0);

  late AnimationController _animationController;

  AnimationController get animationController => _animationController;
  bool get playing => _playing;
  Duration get duration => _duration;
  Duration get current => _current;
  double get porcentaje =>
      _duration.inSeconds > 0 ? _current.inSeconds / _duration.inSeconds : 0;
  String get songTotalDuration => printDuration(_duration);
  String get currentDuration => printDuration(_current);

  set animationController(AnimationController valor) {
    _animationController = valor;
  }

  set playing(bool valor) {
    _playing = valor;
    notifyListeners();
  }

  set duration(Duration valor) {
    _duration = valor;
    notifyListeners();
  }

  set current(Duration valor) {
    _current = valor;
    notifyListeners();
  }

  String printDuration(Duration duration) {
    String twoDigit(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitiMinutes = twoDigit(duration.inMinutes.remainder(60));
    String twoDigitiseconds = twoDigit(duration.inSeconds.remainder(60));
    return "$twoDigitiMinutes:$twoDigitiseconds";
  }
}
