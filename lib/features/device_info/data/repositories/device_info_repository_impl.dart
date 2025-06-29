import 'package:book_finder_app/features/device_info/domain/entities/device_info_entity.dart';

import '../../domain/repositories/device_info_repository.dart';
import '../data_sources/device_info_data_source.dart';

class DeviceInfoRepositoryImpl extends DeviceInfoRepository {
  final DeviceInfoDataSource _deviceInfoDataSource;

  DeviceInfoRepositoryImpl(this._deviceInfoDataSource);
  @override
  Future<DeviceInfoEntity> getDeviceInfo() async {
    return DeviceInfoEntity(
      deviceName: await _deviceInfoDataSource.getDeviceName(),
      osVersion: await _deviceInfoDataSource.getOSVersion(),
      battery: await _deviceInfoDataSource.getBattery(),
    );
  }
}
