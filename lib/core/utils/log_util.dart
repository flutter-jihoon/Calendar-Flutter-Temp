import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger(printer: SimplePrinter(), output: ConsoleOutput());

class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    if (kReleaseMode || !Platform.isIOS) {
      event.lines.forEach(debugPrint);
    } else {
      event.lines.forEach(log);
    }
  }
}
