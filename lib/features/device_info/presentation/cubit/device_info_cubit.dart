import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_device_info.dart';
import 'device_info_state.dart';

class DeviceInfoCubit extends Cubit<DeviceInfoState> {
  final GetDeviceInfo getDeviceInfo;
  DeviceInfoCubit(this.getDeviceInfo) : super(DeviceInfoState());
  Future<void> loadInfo() async {
    emit(DeviceInfoState(loading: true));
    final info = await getDeviceInfo();
    emit(DeviceInfoState(loading: false, info: info));
  }
}
