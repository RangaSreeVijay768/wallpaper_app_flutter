import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
Logger get logger => Log.instance;

class Log extends Logger {
  Log._() : super(
    level: kReleaseMode ? Level.warning : Level.debug,
      printer: PrettyPrinter(printTime: true));
  static final instance = Log._();
}
