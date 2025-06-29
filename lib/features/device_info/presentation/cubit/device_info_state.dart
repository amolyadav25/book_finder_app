import '../../domain/entities/device_info_entity.dart';

class DeviceInfoState {
  final bool loading;
  final DeviceInfoEntity? info;

  DeviceInfoState({this.loading = true, this.info});
}
