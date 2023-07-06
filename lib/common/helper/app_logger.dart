import 'dart:developer' as dev;

class AppLogger {
  AppLogger._();

  /// Colorizes VSCode terminal output to Green Color
  static String _colorizeInfo(String msg) => '\x1B[32m$msg\x1B[0m';

  /// Colorizes VSCode terminal output to Yellow Color
  static String _colorizeWarning(String msg) => '\x1B[33m$msg\x1B[0m';

  /// Colorizes VSCode terminal output to Red Color
  static String _colorizeError(String msg) => '\x1B[31m$msg\x1B[0m';

  static void logInfo(dynamic message, {String? name}) {
    dev.log(
      _colorizeInfo(message.toString()),
      level: 500,
      name: name ?? 'InternSathi',
    );
  }

  static void logWarning(dynamic message, {String? name}) {
    dev.log(
      _colorizeWarning(message.toString()),
      level: 900,
      name: name ?? 'InternSathi',
    );
  }

  static void logError(
    dynamic message, {
    String? name,
    Object? error,
    StackTrace? stackTrace,
  }) {
    dev.log(
      _colorizeError(message.toString()),
      level: 1000,
      name: name ?? 'InternSathi',
      error: error,
      stackTrace: stackTrace,
    );
  }
}
