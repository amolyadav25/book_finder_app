import '../../domain/repositories/sensor_repository.dart';
import '../data_sources/sensor_data_source.dart';

class SensorRepositoryImpl extends SensorRepository {
  final SensorDataSource _sensorDataSource;

  SensorRepositoryImpl(this._sensorDataSource);
  @override
  Future<void> toggleFlashLight(bool status) =>
      _sensorDataSource.toggleFlashLight(status);
}
