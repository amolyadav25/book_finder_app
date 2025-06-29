import '../entities/device_info_entity.dart';
import '../repositories/device_info_repository.dart';

class GetDeviceInfo {
  final DeviceInfoRepository deviceInfoRepository;

  GetDeviceInfo(this.deviceInfoRepository);

  Future<DeviceInfoEntity> call() => deviceInfoRepository.getDeviceInfo();
}
