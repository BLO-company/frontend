import 'dart:developer';

import 'package:flutter/material.dart';

class MapProvider extends ChangeNotifier {
  bool _small = true;

  bool get small => _small;

  set small(bool i) {
    _small = i;
    ChangeNotifier();
    log('Se cambió');
  }
}
