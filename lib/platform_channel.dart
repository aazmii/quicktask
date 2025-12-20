import 'package:flutter/services.dart';
import 'package:timezone/timezone.dart' as tz;

class TimezoneChannel {
  static const MethodChannel _channel = MethodChannel('timezone');

  static Future<void> init() async {
    final String tzName =
        await _channel.invokeMethod<String>('getTimeZone') ?? 'UTC';

    tz.setLocalLocation(tz.getLocation(tzName));
  }
}
