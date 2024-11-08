import 'dart:io';

String get apiBaseUrl {
  if (Platform.isIOS) {
    return 'http://127.0.0.1:8080';
  } else if (Platform.isAndroid) {
    return 'http://10.0.2.2:8080';
  } else {
    return 'http://localhost:8080';
  }
}
