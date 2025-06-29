import 'package:book_finder_app/features/device_info/presentation/cubit/sensor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/toggle_flashlight.dart';

class SensorCubit extends Cubit<SensorState> {
  final ToggleFlashLight _toggleFlashLight;

  SensorCubit(this._toggleFlashLight) : super(SensorState());
  Future<void> toggle() async {
    final newStatus = !state.on;
    await _toggleFlashLight(newStatus);
    emit(SensorState(on: newStatus));
  }
}
