import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/gps/gps_bloc.dart';
import '../pages/_pages.dart';
import '../prefabs/_prefabs.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted
              ? const FeedScreen()
              : const GpsAccessPage();
        },
      ),
    );
  }
}
