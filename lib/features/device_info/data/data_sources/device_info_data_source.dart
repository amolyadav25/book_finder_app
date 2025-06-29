import 'package:flutter/services.dart';

import '../../../../core/platform/platform_constant.dart';

class DeviceInfoDataSource {
  final MethodChannel _channel = MethodChannel(NativeChannel.device);

  Future<String> getBattery() =>
      _channel.invokeMethod('getBatteryLevel').then((v) => '$v%');
  Future<String> getOSVersion() async =>
      await _channel.invokeMethod('getOSVersion');
  Future<String> getDeviceName() async =>
      await _channel.invokeMethod('getDeviceName');
}
