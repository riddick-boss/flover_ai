import 'dart:developer';

import 'package:flutter/foundation.dart';

void logd(
  String message, {
  String tag = 'FloverLogd',
}) {
  if (kDebugMode) {
    log(message, name: tag);
  }
}
