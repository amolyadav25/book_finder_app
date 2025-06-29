import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../cubit/device_info_cubit.dart';
import '../cubit/device_info_state.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: BlocBuilder<DeviceInfoCubit, DeviceInfoState>(
        builder: (context, state) {
          if (state.loading) {
            return Center(
              child: Lottie.asset('assets/loading.json', width: 120),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text('Device : ${state.info?.deviceName}'),
                Text('Battery : ${state.info?.battery}'),
                Text('Device : ${state.info?.deviceName}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
