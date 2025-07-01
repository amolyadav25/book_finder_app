import 'package:book_finder_app/routes/app_routes.dart';
import 'package:book_finder_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/network/api_client.dart';
import 'features/device_info/data/data_sources/device_info_data_source.dart';
import 'features/device_info/data/data_sources/sensor_data_source.dart';
import 'features/device_info/data/repositories/device_info_repository_impl.dart';
import 'features/device_info/data/repositories/sensor_repository_impl.dart';
import 'features/device_info/domain/repositories/device_info_repository.dart';
import 'features/device_info/domain/repositories/sensor_repository.dart';
import 'features/device_info/presentation/cubit/device_info_cubit.dart';
import 'features/device_info/presentation/cubit/sensor_cubit.dart';
import 'features/find_book/data/data_sources/book_remote_data_source.dart';
import 'features/find_book/data/repository/book_repository_impl.dart';
import 'features/find_book/domain/repository/book_repository.dart';
import 'features/find_book/presentation/bloc/book/bloc.dart';
import 'features/find_book/presentation/bloc/book/event.dart';

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiClient = ApiClient();
    final remoteDataSource = BookRemoteDataSource(apiClient);
    final bookRepository = BookRepositoryImpl(remoteDataSource);
    final deviceDataSource = DeviceInfoDataSource();
    final sensorDataSource = SensorDataSource();

    final deviceRepository = DeviceInfoRepositoryImpl(deviceDataSource);
    final sensorRepository = SensorRepositoryImpl(sensorDataSource);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BookRepository>(create: (_) => bookRepository),
        RepositoryProvider<DeviceInfoRepository>(
          create: (_) => deviceRepository,
        ),
        RepositoryProvider<SensorRepository>(create: (_) => sensorRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BookBloc>(
            create: (context) =>
                BookBloc(s1())
                  ..add(SearchBooks('flutter')),
          ),
          BlocProvider(
            create: (context) => DeviceInfoCubit(
                s1()
            )..loadInfo(),
          ),
          BlocProvider(
            create: (context) =>
                SensorCubit(s1()),
          ),
        ],
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routerConfig: AppRoutes.router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
