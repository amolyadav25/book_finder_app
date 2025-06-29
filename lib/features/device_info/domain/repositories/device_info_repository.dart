import '../entities/device_info_entity.dart';

abstract class DeviceInfoRepository {
  Future<DeviceInfoEntity> getDeviceInfo();
}
