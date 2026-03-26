import 'dart:io';

import 'package:flutter/services.dart';

Future<void> setupScreenWindow() async {
  if (!Platform.isWindows) return;
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
