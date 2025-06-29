import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/sensor_cubit.dart';
import '../cubit/sensor_state.dart';

class SensorPage extends StatelessWidget {
  const SensorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sensor Info')),
      body: Center(
        child: BlocBuilder<SensorCubit, SensorState>(
          builder: (context, state) {
            return IconButton(
              iconSize: 100,
              onPressed: () {
                context.read<SensorCubit>().toggle();
              },
              icon: Icon(state.on ? Icons.flashlight_on : Icons.flashlight_off),
            );
          },
        ),
      ),
    );
  }
}
