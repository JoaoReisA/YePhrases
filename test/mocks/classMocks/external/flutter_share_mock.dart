import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

mockFlutterShare() async {
  const channel = MethodChannel('flutter_share');

  handler(MethodCall methodCall) async {
    if (methodCall.method == 'share') {
      return true;
    }
    return false;
  }

  TestWidgetsFlutterBinding.ensureInitialized();

  TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
      .setMockMethodCallHandler(channel, handler);
}
