import 'package:flutter/material.dart';
import '../prefabs/_prefabs.dart';

class GpsProvider extends ChangeNotifier {
  void isAllGranted(BuildContext i) {
    gpsErrorAlert(i);

    // final gpsBloc = BlocProvider.of<GpsBloc>(context);
    // gpsBloc.state.isAllGranted ? 'bien' : 'mal';
  }

  // final gpsBloc = BlocProvider.of<GpsBloc>(context);
  // gpsBloc.askGpsAccess();
}
