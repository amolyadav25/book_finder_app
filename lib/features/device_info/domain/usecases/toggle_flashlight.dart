import '../repositories/sensor_repository.dart';

class ToggleFlashLight {
  final SensorRepository sensorRepository;

  ToggleFlashLight(this.sensorRepository);
  Future<void> call(bool status) => sensorRepository.toggleFlashLight(status);
}
