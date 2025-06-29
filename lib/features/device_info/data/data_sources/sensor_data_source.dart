import 'package:flutter/services.dart';

import '../../../../core/platform/platform_constant.dart';

class SensorDataSource {
  final _channel = const MethodChannel(NativeChannel.sensor);
  Future<void> toggleFlashLight(bool status) async {
    await _channel.invokeMethod('toggleFlashLight', {'status': status});
  }
}
