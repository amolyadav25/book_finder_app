
import 'package:book_finder_app/core/network/api_client.dart';
import 'package:book_finder_app/features/device_info/data/data_sources/device_info_data_source.dart';
import 'package:book_finder_app/features/device_info/data/data_sources/sensor_data_source.dart';
import 'package:book_finder_app/features/device_info/data/repositories/device_info_repository_impl.dart';
import 'package:book_finder_app/features/device_info/data/repositories/sensor_repository_impl.dart';
import 'package:book_finder_app/features/device_info/domain/repositories/device_info_repository.dart';
import 'package:book_finder_app/features/device_info/domain/repositories/sensor_repository.dart';
import 'package:book_finder_app/features/device_info/domain/usecases/get_device_info.dart';
import 'package:book_finder_app/features/device_info/domain/usecases/toggle_flashlight.dart';
import 'package:book_finder_app/features/find_book/data/data_sources/book_remote_data_source.dart';
import 'package:book_finder_app/features/find_book/data/repository/book_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'features/find_book/domain/repository/book_repository.dart';

final s1 = GetIt.instance;

void initServiceLocator() {
  s1.registerLazySingleton(() => ApiClient());

  s1.registerLazySingleton(() => BookRemoteDataSource(s1()));
  s1.registerLazySingleton(()=> DeviceInfoDataSource());
  s1.registerLazySingleton(() => SensorDataSource());

  s1.registerLazySingleton<BookRepository>(()=>BookRepositoryImpl(s1()));
  s1.registerLazySingleton<DeviceInfoRepository>(()=>DeviceInfoRepositoryImpl(s1()));
  s1.registerLazySingleton<SensorRepository>(()=>SensorRepositoryImpl(s1()));

  s1.registerLazySingleton(()=>GetDeviceInfo((s1())));
  s1.registerLazySingleton(()=>ToggleFlashLight(s1()));
}
