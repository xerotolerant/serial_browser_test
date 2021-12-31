@JS('navigator.serial')
library serial;

import 'package:js/js.dart';
import 'dart:js_util';

@JS('requestPort')
external SerialPort requestPort();

@JS()
class SerialPort {
  external open(SerialOptions options);
}

@JS()
@anonymous
class SerialOptions {
  external int get baudRate;
  external factory SerialOptions({int baudRate});
}
